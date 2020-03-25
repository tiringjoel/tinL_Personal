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
# enter /sys/class/gpio
# create gpio53
# direction of gpio53 out
# write 1 > gpio53/value
#       0> gpio53/value

