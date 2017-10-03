#!/bin/bash
#-----------------------
#tinyproxy.sh direct call
#(c) H.Buchmann FHNW 2015
#-----------------------
#we are in 3-network
TINYPROXY=tinyproxy
[[ ! -d ${TINYPROXY} ]] && mkdir ${TINYPROXY}
tail -f ${TINYPROXY}/log.log &
TAIL_PID=${?}
trap 'kill ${TAIL_PID}' INT
tinyproxy  -d -c config/tinyproxy.conf 
