#!/bin/bash
#----------------------
#copy-newer.sh
#(c) H.Buchmann FHNW 2020
# target-root
#  bin
#  ..
#  update  empty file
#   create with: touch update
#----------------------
#TODO check if mount really mounted
cd target-root
find . -not -type d -newer update \
-exec install -v -D --owner=root --group=root {} ../mount/{} \;
