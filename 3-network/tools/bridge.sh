#!/bin/bash
#----------------------
#bridge.sh
#(c) H.Buchmann FHNW 2020
#----------------------
BRIDGE=bwg
sudo brctl addbr ${BRIDGE}
sudo brctl addif ${BRIDGE} enp0s20f0u3u1u2
sudo brctl addif ${BRIDGE} enp0s20f0u3u2
sudo ifconfig ${BRIDGE} up
brctl show

#ip link set dev ${BRIDGE} up
