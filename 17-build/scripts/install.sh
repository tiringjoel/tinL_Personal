#-----------------------------
#install.sh
#(c) H.Buchmann FHNW 2014
#-----------------------------
[[ -z ${1} ]] &&
{
 echo "usage ${0} image"
 exit 1 
}

scp ${1} root@192.168.1.4:/work
