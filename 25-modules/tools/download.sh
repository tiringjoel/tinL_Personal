#-----------------------
#download.sh
#(c) H.Buchmann FHNW 2015
#${1} module
#-----------------------
#we are in src
#using scp 
DST=root@192.168.1.141:/work
scp ${1} ${DST}
