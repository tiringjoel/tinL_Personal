#!/bin/bash
#-------------------------
#host-target.sh
#(c) H.Buchmann FHNW 2020
# sync host to target
# target mounted 
#-------------------------
#we are in 17-build
#mount mounted per sshfs
SRC_ROOT=${PWD}/target-root
DST_ROOT=${PWD}/mount

#-a = -rlptgoD
rsync -rlptDv --owner=root --group=root   ${SRC_ROOT}/ ${DST_ROOT}

