#!/bin/bash
#-------------------
#wpa_eduroam.sh
#(c) H,Buchmann FHNW 2017
#https://unix.stackexchange.com/questions/278946/hiding-passwords-in-wpa-supplicant-conf-with-wpa-eap-and-mschap-v2
#-------------------
function usage()
{
 echo "${0} identity"
 exit 1
}

[[ -z ${1} ]] && usage

echo -n "Password="
read -s PW
cat<< EOF
ctrl_interface=/run/wpa_supplicant
update_config=1
network={
  ssid="eduroam"
  key_mgmt=WPA-EAP
  eap=PEAP
  identity="${1}"
#  subject_match="grueezi.fhnw.ch"
  phase2="auth=MSCHAPV2"
  password=hash:$(echo -n ${PW} | iconv -t UTF-16LE | openssl md4 | sed "s/^(stdin)=\W*//")
}
EOF
