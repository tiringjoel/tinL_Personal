#!/bin/sh
#-----------------------
#gpio.sh
#(c) H.Buchmann FHNW 2020
#[1] doc/BBB_SRM.pdf
#[2] linux/Documentation/gpio/sysfs.txt
#    disable LEDS_GPIO in kernel
#    new kernel zImage see 5-kernel
#-----------------------
PIN=53 #32+21 LED USR0
cd /sys/class/gpio
echo $PIN > export
echo out > gpio$PIN/direction

echo 1 > gpio$PIN/value
echo 0 > gpio$PIN/value
