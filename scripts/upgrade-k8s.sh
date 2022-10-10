#!/bin/sh 

set -eo pipefail

yq '.machine.kubelet.image = "ghcr.io/siderolabs/kubelet:v'$1'"' -i talos/controlplane.yaml
yq '.cluster.apiServer.image = "k8s.gcr.io/kube-apiserver:v'$1'"' -i talos/controlplane.yaml
yq '.cluster.controllerManager.image = "k8s.gcr.io/kube-controller-manager:v'$1'"' -i talos/controlplane.yaml
yq '.cluster.proxy.image = "k8s.gcr.io/kube-proxy:v'$1'"' -i talos/controlplane.yaml
yq '.cluster.scheduler.image = "k8s.gcr.io/kube-scheduler:v'$1'"' -i talos/controlplane.yaml

yq '.machine.kubelet.image = "ghcr.io/siderolabs/kubelet:v'$1'"' -i talos/worker.yaml
