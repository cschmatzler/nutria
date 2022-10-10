locals {
  # SSH
  # ---
  ssh_private_key = trimspace(file(var.private_key))
  ssh_public_key  = trimspace(file(var.public_key))

  # Network
  # -------
  rdns_domain = "nutria.cloud"

  control_plane_nodes = {
    count       = 3
    name        = "control-plane",
    server_type = "cpx11",
    location    = "fsn1",
  }

  worker_nodepools = [
    {
      count       = 2
      name        = "worker-cpx21",
      server_type = "cpx21",
      location    = "fsn1",
    },
    {
      count       = 1
      name        = "worker-cx31",
      server_type = "cx31",
      location    = "fsn1",
    },

  ]

  # Hosts
  # -----
  worker_count = sum([for v in local.worker_nodepools : v.count])
  worker_nodes = merge([
    for pool_index, nodepool in local.worker_nodepools : {
      for node_index in range(nodepool.count) :
      format("%s-%s-%s", pool_index, node_index, nodepool.name) => {
        index : node_index,
        nodepool_name : nodepool.name,
        server_type : nodepool.server_type,
        location : nodepool.location
      }
    }
  ]...)
}
