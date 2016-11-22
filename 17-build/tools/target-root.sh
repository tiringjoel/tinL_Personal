#!/bin/bash
#------------------
#target-root.sh
#(c) H.Buchmann FHNW 2015
#------------------
. scripts/common.sh

function copy() # $1 src $2 dest in ${TARGET_ROOT}
{
 [[ ! -e ${TARGET_ROOT}/${2} ]] && cp ${BUILD_HOME}/${1} ${TARGET_ROOT}/${2}
}

function crdir()
{
  mkdir -p ${TARGET_ROOT}/${1}
}


crdir proc
crdir sys
crdir dev
crdir home/root
crdir dev/pts
crdir etc/init.d
copy config/rcS.first /etc/init.d/rcS

DATE=$(date '+%Y.%m.%d')

fakeroot tar -cvzf ${BUILD_HOME}/target-root-${DATE}.tar.gz -C ${TARGET_ROOT} .
#copy to sd-card
#   home-of-sd-card  .
#sync
