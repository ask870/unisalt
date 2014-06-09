#!/bin/bash

set -e 

# From https://www.rootda.org/wordpress/?p=637

crm configure property stonith-enabled=false
crm configure primitive ClusterIP ocf:heartbeat:IPaddr2 params ip={{ pillar['floating_ip'] }} cidr_netmask=24 op monitor interval=5s
crm configure property no-quorum-policy=ignore
crm configure rsc_defaults resource-stickiness=100

