set dotenv-load

fmt:
  terraform fmt -recursive
  prettier -w **/*.yaml

init:
  packer init image
  terraform -chdir=nodes init
  if [ ! -f talos/controlplane.yaml ]; then talosctl gen config nutria https://cluster.nutria.cloud:6443 -o=talos/ --talos-version=v1.1.0 --with-kubespan --with-examples=false --with-docs=false; fi
  scripts/set-external-cloud-provider.sh

build:
  packer build image

plan: 
  terraform -chdir=nodes plan -out=nutria.tfplan

deploy: plan
  terraform -chdir=nodes apply nutria.tfplan

destroy:
  terraform -chdir=nodes destroy

generate-kubeconfig:
  talosctl kubeconfig kubeconfig

generate-secret name output:
  gomplate -f secrets/{{name}}.yaml.tpl | kubeseal | yq -P '.' | tee {{output}}

deploy-ccm:
  gomplate -f secrets/hcloud.yaml.tpl | kubectl apply -f -
  kustomize build ccm | kubectl apply -f -

bootstrap-flux:
  flux bootstrap github \
    --owner=cschmatzler \
    --repository=nutria \
    --path=workloads \
    --personal \
    --author-email=christoph@medium.place \
    --author-name="Christoph Schmatzler" \
    --components=source-controller,kustomize-controller,notification-controller
