resource "hcloud_placement_group" "control_plane" {
  name = "control-plane"
  type = "spread"
}

resource "hcloud_placement_group" "workers" {
  count = ceil(local.worker_count / 10)

  name = "workers-${count.index + 1}"
  type = "spread"
}
