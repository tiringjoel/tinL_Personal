#!/bin/bash
#-------------------
#mount.sh
# must be executable 
#(c) H.Buchmann FHNW 2015
#--------------------
BASENAME=$(dirname $(dirname ${0}))
TARGET_ROOT=${BASENAME}/target-root
echo "mount/link DEVNAME=${1} ID=${2}" >>/tmp/callback.log 
echo "ls /run/media/buchmann/">>/tmp/callback.log
ls /run/media/buchmann/>>/tmp/callback.log 
#--------------- uncomment for mount
#[[ ! -d ${TARGET_ROOT} ]] && mkdir ${TARGET_ROOT}
echo "mount ${@} ${TARGET_ROOT}">>/tmp/callback.log 
umount ${1} 2>>/tmp/callback.log 
echo "umount error ${?}">>/tmp/callback.log 
#mount ${1} ${TARGET_ROOT} 2>>/tmp/callback.log
gvfs-mount -d ${1} ${TARGET_ROOT} 2>>/tmp/callback.log
echo "mount error ${?}">>/tmp/callback.log 
echo "------------- ${TARGET_ROOT}">>/tmp/callback.log  
ls ${TARGET_ROOT} >>/tmp/callback.log 
