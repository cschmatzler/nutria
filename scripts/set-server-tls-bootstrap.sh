#!/bin/sh

set -eo pipefail

yq '.machine.kubelet += {"extraConfig": {"serverTLSBootstrap": true}}' -i talos/controlplane.yaml
yq '.machine.kubelet += {"extraConfig": {"serverTLSBootstrap": true}}' -i talos/worker.yaml
