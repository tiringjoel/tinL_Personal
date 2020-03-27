#!/bin/sh
#-----------------------
#init-lighttpd.bin
#(c) J.Wirz 2020
#-----------------------

# Initialize Pin
PIN=53 			#32+21 LED USR0
cd /sys/class/gpio
echo $PIN > export
echo out > gpio$PIN/direction
chmod 666 gpio$PIN/value

# Start lighttpd
cd
cd ../..
./usr/local/sbin/lighttpd -D -f /etc/lighttpd.conf 
