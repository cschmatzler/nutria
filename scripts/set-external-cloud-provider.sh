#!/bin/sh

set -eo pipefail

yq '.machine.kubelet += {"extraArgs": {"cloud-provider": "external"}}' -i talos/controlplane.yaml
yq '.machine.kubelet += {"extraArgs": {"cloud-provider": "external"}}' -i talos/worker.yaml
