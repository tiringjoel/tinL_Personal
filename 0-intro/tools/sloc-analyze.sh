#!/bin/bash
#-------------------------
#sloccount.sh
#(c) H.Buchmann FHNW 2018
#-------------------------
#we are in 0-intro
[[ ! -d sloc ]] && mkdir sloc
sloccount --cached --details --datadir sloc 
