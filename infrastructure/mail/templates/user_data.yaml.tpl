#cloud-config

apt:
  sources:
    docker.list:
      source: deb [arch=amd64] https://download.docker.com/linux/debian bullseye stable
      keyid: 9DC858229FC7DD38854AE2D88D81803C0EBFCD88

packages:
  - apt-transport-https
  - ca-certificates
  - curl
  - gnupg-agent
  - software-properties-common
  - kitty-terminfo
  - git
  - docker-ce
  - docker-ce-cli
  - docker-compose-plugin
  - containerd.io

mounts:
  - [sdb, /var/lib/docker/volumes, auto, "defaults,noexec"]

write_files:
  - path: /etc/sysctl.d/enabled_ipv4_forwarding.conf
    content: |
      net.ipv4.conf.all.forwarding=1
  - path: /etc/mailcow-config/mailcow.conf 
    content: !!binary |
      ${mailcow_conf} 
  - path: /etc/mailcow-config/data/conf/nginx/redirect.conf
    content: !!binary |
      ${redirect_conf}

groups:
  - docker

system_info:
  default_user:
    groups: [docker]

runcmd:
  - git clone https://github.com/mailcow/mailcow-dockerized /etc/mailcow-dockerized
  - cp /etc/mailcow-config/mailcow.conf /etc/mailcow-dockerized/mailcow.conf
  - cp /etc/mailcow-config/data/conf/nginx/redirect.conf /etc/mailcow-dockerized/data/conf/nginx/redirect.conf
  - cd /etc/mailcow-dockerized && docker compose up -d
