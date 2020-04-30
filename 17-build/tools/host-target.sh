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
rsync -rlptDv --chown=root:root   ${SRC_ROOT}/ ${DST_ROOT}
#rsync -rlptDv --chown=root:root ${SRC_ROOT}/etc/wpa.conf  ${DST_ROOT}/etc/wpa.conf
#cp -av ${SRC_ROOT}/ ${DST_ROOT}
# preserves ownership 
# chown -R root:root  ${DST_ROOT}
#alternative
#install 
