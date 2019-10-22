#!/bin/sh
#---------------------
#led-enable.sh
#(c) H.Buchmann FHNW 2019
#[1] doc/BBB_SRM.pdf
#disable LEDS_GPIO in kernel
#---------------------
# see [1] 6.6
#USR0 GPIO1_21 32+21= 53
#USR1 GPIO1_22 32+22= 54    
#USR2 GPIO1_23 32+23= 55   
#USR3 GPIO1_24 32+24= 56   

PIN=53

cd /sys/class/gpio
echo $PIN > export
echo out > gpio${PIN}/direction

