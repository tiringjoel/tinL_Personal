#!/bin/bash
#--------------------
#update-target-root.sh
#(c) H.Buchmann FHNW 2019
#--------------------
. $(dirname ${0})/config.sh

TAR=${TARGET_ROOT}.tar
[[ ! -f ${TAR} ]] &&
{
 fakeroot tar -cvf ${TAR} -C ${TARGET_ROOT} .
 exit 0
}
fakeroot tar -uvf ${TAR} -C ${TARGET_ROOT} .

