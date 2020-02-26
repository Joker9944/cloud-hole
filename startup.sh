#!/usr/bin/env bash

# https://serverfault.com/questions/973868/how-do-i-bind-to-udp-port-53-in-gce-container-optimized-os
systemctl stop systemd-resolved

cd ~/cloud-hole
docker-compose up --detach
