#!/bin/bash
#------------------
#target-root.sh
#(c) H.Buchmann FHNW 2018
#------------------
. $(dirname ${0})/config.sh

function copy() # $1 src $2 dest in ${TARGET_ROOT}
{
 [[ ! -e ${TARGET_ROOT}/${2} ]] && cp ${PWD}/${1} ${TARGET_ROOT}/${2}
}

function crdir()
{
  mkdir -p ${TARGET_ROOT}/${1}
}

RSA_KEY=${TARGET_ROOT}/etc/ssh_host_rsa_key
[[ ! -f ${RSA_KEY} ]] &&
{
ssh-keygen -t rsa -f ${TARGET_ROOT}/etc/ssh_host_rsa_key
}
crdir boot
crdir proc
crdir sys
crdir dev
crdir home/root
crdir dev/pts
crdir etc/init.d



rsync -av ${PWD}/config/target-root/ ${TARGET_ROOT}/ 


rm -f ${TARGET_ROOT}/made*
DATE=$(date '+%Y.%m.%d')
touch ${TARGET_ROOT}/made-${DATE}
tar --owner=root --group=root -cvzf ${PWD}/target-root-${DATE}.tar.gz -C ${TARGET_ROOT} .
#copy to sd-card
#   home-of-sd-card  .
#sync
