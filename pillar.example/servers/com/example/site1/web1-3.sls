roles:
  - web
  - cluster
  - balancer
static:
  ip: 1.2.3.13
  mask: 255.255.255.0
  gateway: 1.2.3.1
private_ip: 192.168.1.13
include:
  - clusters.web1

