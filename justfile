set dotenv-load

fmt:
  terraform fmt -recursive
  prettier -w */**/*.yaml

docs:
  mdbook build docs

init:
  packer init os
  terraform -chdir=infrastructure init
  if [ ! -f talos/controlplane.yaml ]; then talosctl gen config nutria https://cluster.nutria.cloud:6443 -o=talos/ --talos-version=v1.1.0 --with-kubespan --with-examples=false --with-docs=false; fi
  if [ ! -f secrets.agekey ]; then age-keygen -o secrets.agekey; fi
  scripts/set-external-cloud-provider.sh
  scripts/set-server-tls-bootstrap.sh

build talos-version:
  packer build -var talos_version={{talos-version}} os 

plan: 
  terraform -chdir=infrastructure plan -out=nutria.tfplan

deploy: plan
  terraform -chdir=infrastructure apply nutria.tfplan

upgrade talos-version nodes:
  scripts/upgrade-talos.sh {{talos-version}}
  talosctl upgrade --nodes {{nodes}} --image ghcr.io/siderolabs/installer:v{{talos-version}}

approve-kubelet-csrs:
  kubectl get csr -o custom-columns=":metadata.name" | xargs -L1 kubectl certificate approve

upgrade-k8s k8s-version:
  scripts/upgrade-k8s.sh {{k8s-version}}
  talosctl upgrade-k8s --to {{k8s-version}}

destroy:
  terraform -chdir=infrastructure destroy

kubeconfig:
  talosctl kubeconfig kubeconfig

generate-secret secret:
  scripts/generate-secret.sh {{secret}}

deploy-ccm:
  gomplate -f secrets/hcloud.yaml.tpl | kubectl apply -f -
  kustomize build ccm | kubectl apply -f -

flux:
  flux bootstrap github \
    --owner=cschmatzler \
    --repository=nutria \
    --path=flux \
    --personal \
    --author-email=christoph@medium.place \
    --author-name="Christoph Schmatzler" \
    --components=source-controller,kustomize-controller,helm-controller,notification-controller
  cat secrets.agekey | kubectl create secret generic sops-age --namespace flux-system --from-file=secrets.agekey=/dev/stdin
