# Structure of the repository

The repository is split into multiple parts:
- `image/` - Packer file to build Talos and create a snapshot
- `infrastructure/` - Terraform files to create the underlying infrastructure for the cluster and supporting nodes.
- `ccm/` - Kustomization for Hetzner's Cloud Controller Manager, dependency for every other workload.
- `flux/` - Flux components and Kustomizations to deploy other workloads.
- `workloads/` - Cluster workloads
- `scripts/` - Supporting scripts
