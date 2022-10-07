#!/bin/sh 

set -eo pipefail

yq '.machine.kubelet.image = "ghcr.io/siderolabs/kubelet:'$1'"' -i talos/controlplane.yaml
yq '.cluster.apiServer.image = "k8s.gcr.io/kube-apiserver:'$1'"' -i talos/controlplane.yaml
yq '.cluster.controllerManager.image = "k8s.gcr.io/kube-controller-manager:'$1'"' -i talos/controlplane.yaml
yq '.cluster.proxy.image = "k8s.gcr.io/kube-proxy:'$1'"' -i talos/controlplane.yaml
yq '.cluster.scheduler.image = "k8s.gcr.io/kube-scheduler:'$1'"' -i talos/controlplane.yaml

yq '.machine.kubelet.image = "ghcr.io/siderolabs/kubelet:'$1'"' -i talos/worker.yaml
