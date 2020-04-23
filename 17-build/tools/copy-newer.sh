#!/bin/bash
#----------------------
#copy-newer.sh
#(c) H.Buchmann FHNW 2020
#----------------------
#TODO check if mount really mounted
cd target-root
find . -not -type d -newer update \
-exec install --owner=root --group=root {} ../mount/{} \;
