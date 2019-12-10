#!/bin/sh
#----------------------------
#hotplug.sh
#(c) H.Buchmann FHNW 2019
#----------------------------
echo "----- hotplug ${@}" >> /home/root/hotplug.log
echo "------------------- env" >> /home/root/hotplug.log
env  >> /home/root/hotplug.log

