#!/bin/bash

echo "pi-hole docker deployment script..."

# Env vars being required by the docker-compose config
IP_LOOKUP="$(ip route get 8.8.8.8 | awk '{ print $NF; exit }')"
export SERVER_IP="${IP:-$IP_LOOKUP}"  # use $IP, if set, otherwise IP_LOOKUP
export UPSTREAM_DNS1="${DNS1:-8.8.8.8}" # Primary upstream DNS server
export UPSTREAM_DNS2="${DNS2:-8.8.4.4}" # Secondary upstream DNS server

echo "Will setup pi-hole with server ip = [$SERVER_IP], dns1 = [$UPSTREAM_DNS1], dns2 = [$UPSTREAM_DNS2]"

docker-compose up -d