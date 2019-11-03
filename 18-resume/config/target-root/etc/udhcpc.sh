#!/bin/sh
#-----------------------
#udhcpd.sh
#(c) H.Buchmann 
#call-back of udhcpc
#-----------------------
echo "---- ${@}"
case ${1} in
 deconfig)
  ifconfig $interface 0.0.0.0
 ;;
 bound|renew)
  ifconfig $interface $ip
  for r in $router 
  do
   route add default gw $r $interface
  done
  echo "" > /etc/resolv.conf
  for d in $dns
  do
   echo "nameserver $d">>/etc/resolv.conf
  done
 ;;
esac
