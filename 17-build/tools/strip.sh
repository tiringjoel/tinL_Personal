#!/bin/bash
#--------------------------
#strip.sh 
#(c) H.Buchmann FHNW 2016
#calling strip.sh directory
#--------------------------
[[ ! -d ${1} ]] && { echo "${1} not a directory"; exit 1; }
find ${1} -executable -type f -exec strip '{}' \;

