#!/bin/sh 

set -eo pipefail

yq '.machine.install.image = "ghcr.io/siderolabs/installer:v'$1'"' -i talos/controlplane.yaml
yq '.machine.install.image = "ghcr.io/siderolabs/installer:v'$1'"' -i talos/worker.yaml

