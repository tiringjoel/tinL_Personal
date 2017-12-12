#---------------------
#tftp-put.sh
#(c) H.Buchmann FHNW 2015
#${1}:ip ${2}:file
#---------------------
tftp -m binary ${1} -c put ${2}
