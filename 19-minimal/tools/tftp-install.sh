#!/bin/bash
#---------------------
#tftp-install.sh
#(c) H.Buchmann FHNW 2017
#---------------------
IP=192.168.7.2
[[ -z ${1} ]] &&
{
 echo "usage ${0} file"
 exit 1
}
tftp -m binary ${IP} -c put ${1}
