#-------------------
#gpio.sh
#(c) H.Buchmann FHNW 2016
#see: kernel/Documentation/gpio/*
#     doc/BBB_SRM.pdf p67
#${1} port
#good ports:
# USR0,1,2,3
# GPIO1 pin  21,22,23,24
# GPIO1 Base 32
# pin#=base+pin
# kernel without LED support:
# Device Drivers
#  LED Support

#-------------------
GPIO=/sys/class/gpio
pin=${1}
#your work


