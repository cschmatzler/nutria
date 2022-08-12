output "ssh_key_id" {
  value = hcloud_ssh_key.workstation.id
}

output "network_id" {
  value = hcloud_network.nutria.id
}

output "cluster_subnet_id" {
  value = hcloud_network_subnet.cluster.id
}
