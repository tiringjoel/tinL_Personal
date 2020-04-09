#!/bin/bash
#-------------------
#picocom.sh
#(c) H.Buchmann FHNW 2020$
#-------------------
CON=/dev/ttyUSB0
[[ ! -z ${1} ]] && CON=${1}
picocom --baud 115200 --flow n --parity n $CON
