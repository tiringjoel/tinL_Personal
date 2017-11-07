#!/bin/bash
#--------------------
#hotspot.sh
#(c) H.Buchmann FHNW 2017
#--------------------
rfkill unblock wlan
sudo create_ap wlp6s0 enp0s20u2 tinL 12345678
