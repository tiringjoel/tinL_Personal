#!/bin/bash
#-------------------
#callback.sh
#(c) H.Buchmann FHNW 2020
#--------------------
echo "------------- Parameters ---------------">>/tmp/callback.log
echo ${@}>>/tmp/callback.log
echo "------------- Environment ---------------">>/tmp/callback.log
env>>/tmp/callback.log
