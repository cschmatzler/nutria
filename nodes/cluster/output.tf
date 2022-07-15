output "control_plane_endpoints" {
  value = [
    for node in module.control_plane_nodes : node.ip_address
  ]
}
