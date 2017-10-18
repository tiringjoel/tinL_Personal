#!/bin/bash
#-------------------
#wpa_eduroam.sh
#(c) H,Buchmann FHNW 2017
#https://unix.stackexchange.com/questions/278946/hiding-passwords-in-wpa-supplicant-conf-with-wpa-eap-and-mschap-v2
#-------------------
function usage()
{
 echo "${0} ssid"
 exit 1
}

[[ -z ${1} ]] && usage

echo -n "Password="
read -s PW
cat<< EOF
ctrl_interface=/run/wpa_supplicant
update_config=1
network={
	ssid="${1}"
	psk=7282f6ff491c548dca68d8c43f39c0e8931cc4e051027d78fbe9be42d5bf9976
}
EOF
