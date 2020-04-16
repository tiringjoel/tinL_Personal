#!/bin/bash
#----------------------
#copy-newer.sh
#(c) H.Buchmann FHNW 2020
#----------------------
cd target-root
find . -not -type d -newer update \
-exec install --owner=root --group=root {} ../mount/{} \;
