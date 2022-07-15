set dotenv-load

fmt:
  terraform fmt -recursive
  prettier -w **/*.yaml

docs:
  mdbook build docs

init:
  packer init image
  terraform -chdir=nodes init
  if [ ! -f talos/controlplane.yaml ]; then talosctl gen config nutria https://cluster.nutria.cloud:6443 -o=talos/ --talos-version=v1.1.0 --with-kubespan --with-examples=false --with-docs=false; fi
  scripts/set-external-cloud-provider.sh
  scripts/set-server-tls-bootstrap.sh

build talos-version:
  packer build -var talos_version={{talos-version}} image 

plan: 
  terraform -chdir=nodes plan -out=nutria.tfplan

deploy: plan
  terraform -chdir=nodes apply nutria.tfplan

upgrade talos-version nodes:
  talosctl upgrade --nodes {{nodes}} --image ghcr.io/siderolabs/installer:v{{talos-version}}

destroy:
  terraform -chdir=nodes destroy

kubeconfig:
  talosctl kubeconfig kubeconfig

generate-secret name output:
  gomplate -f secrets/{{name}}.yaml.tpl | kubeseal | yq -P '.' | tee {{output}}

ccm:
  gomplate -f secrets/hcloud.yaml.tpl | kubectl apply -f -
  kustomize build ccm | kubectl apply -f -

flux:
  flux bootstrap github \
    --owner=cschmatzler \
    --repository=nutria \
    --path=workloads \
    --personal \
    --author-email=christoph@medium.place \
    --author-name="Christoph Schmatzler" \
    --components=source-controller,kustomize-controller,notification-controller
