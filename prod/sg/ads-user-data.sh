#cloud-config
hostname: ads-server
ssh_authorized_keys:
 - ssh key goes here
rancher:
  console: centos
  resize_device: /dev/sda
  enable: true
  debug: true
write_files:
  - path: /opt/salt-minion/minion
    permissions: "0644"
    owner: root
    content: |
      master: 10.0.0.10
