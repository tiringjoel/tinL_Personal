#!/bin/bash
#--------------------------------
#usb-eth.sh
#(c) H.Buchmann FHNW 2018
#--------------------------------
echo "--------------- action: ${1} device: ${2} ID_VENDOR_ID: ${3}" >> /tmp/usb-eth.log
case ${1} in 
 enable)
 ifconfig ${2} 192.168.7.1
 ;;
 disable)
 ifconfig ${2} down
 ;;
esac
