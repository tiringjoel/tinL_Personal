#!/bin/bash
#--------------------
#rsync.sh
#(c) H.Buchmann FHNW 2016
# example
# make it executable with
# chmod a+x rsync.sh
#--------------------
echo "build rsync"
#setup pathnames
# all paths absolute
BUILD_HOME=${PWD}

RSYNC_SRC=${BUILD_HOME}/../../resources/rsync-3.1.2/
