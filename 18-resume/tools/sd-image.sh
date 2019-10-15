#!/bin/bash
#----------------------
#sd-image.sh
#(c) H.Buchmann FHNW 2019
#----------------------
GAP_SIZE_MiB=1
BOOT_SIZE_MiB=64
ROOT_SIZE_MiB=256
#layout
# GAP
# BOOT          
# ROOT
cd sd
dd if=/dev/urandom of=img count=$(((GAP_SIZE_MiB + BOOT_SIZE_MiB + ROOT_SIZE_MiB)*(1<<20)/512))

parted
mklabel
