#!/bin/bash
#-------------------
#callback.sh
#(c) H.Buchmann FHNW 2020
# must be executable
# chmod a+x callback.sh
#--------------------
echo "------------- Parameters ---------------">>/tmp/callback.log
echo ${@}>>/tmp/callback.log
echo "------------- Environment ---------------">>/tmp/callback.log
env>>/tmp/callback.log
