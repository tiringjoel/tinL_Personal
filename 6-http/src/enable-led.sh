#!/bin/sh
#-----------------------
#enable-led.sh
#(c) H.Buchmann FHNW 2020
#-----------------------
PIN=53
cd /sys/class/gpio/
echo $PIN > export
echo out > gpio$PIN/direction
