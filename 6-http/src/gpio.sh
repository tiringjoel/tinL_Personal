#!/bin/sh
#-----------------------
#gpio.sh
#(c) H.Buchmann FHNW 2020
#[1] doc/BBB_SRM.pdf
#[2] linux/Documentation/gpio/sysfs.txt
#    disable LEDS_GPIO in kernel
#    new kernel zImage see 5-kernel
#-----------------------
PIN=53 #32+21 LED USR0 BBB_SRM GPIO1_21
# GPIO_0:  0 .. 31  32 pins
# GPIO_1: 32 .. 63  32 pins
# GPIO_2: 64 .. 95  32 pins

# enter /sys/class/gpio
# create gpio53:            echo 53  > export
# direction of gpio53 out   echo out > gpio53/direction
# write 1 > gpio53/value    echo 1 > gpio53/value
#       0> gpio53/value     echo 0 > gpio53/value

