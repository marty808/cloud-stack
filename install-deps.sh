#!/bin/bash

# 1. enable IPv6 for docker
# get ip addr
INTERFACE="eth0"
IPV6=$(netplan get ethernets.${INTERFACE}.addresses | cut -d' ' -f2)

# config deamon.json
echo '{
  "ipv6": true,
  "fixed-cidr-v6": "'${IPV6}'"
}' > /etc/docker/daemon.json

# reload docker
systemctl restart docker
