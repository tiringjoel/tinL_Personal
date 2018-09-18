#!/bin/bash
#-------------------------
#sloccount.sh
#(c) H.Buchmann FHNW 2018
#-------------------------
#we are in 0-intro
LINUX_SRC=${PWD}/../resources/beaglebone-black/linux
[[ ! -d sloc ]] && mkdir sloc
sloccount --datadir sloc ${LINUX_SRC}
