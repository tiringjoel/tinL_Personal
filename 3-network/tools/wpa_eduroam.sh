#!/bin/bash
#-------------------
#wpa_eduroam.sh
#(c) H,Buchmann FHNW 2017
#https://github.com/oleks/eduroam-wpa_supplicant
#-------------------
function usage()
{
 echo "${0} identity"
 exit 1
}

[[ -z ${1} ]] && usage

echo -n "Password= " >&2q
read -s PW
cat<< EOF
ctrl_interface=/run/wpa_supplicant
update_config=1
network={
  ssid="eduroam"
  key_mgmt=WPA-EAP
  eap=PEAP
  identity="${1}"
  phase2="auth=MSCHAPV2"
  password=hash:$(echo -n ${PW} | iconv -t UTF-16LE | openssl md4 | sed "s/^(stdin)=\W*//")
}
EOF
