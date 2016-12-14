#!/bin/bash
#--------------------
#rsync.sh
#(c) H.Buchmann FHNW 2016
# example
# make it executable with
# chmod a+x rsync.sh
#--------------------
#file made with: 
# touch .$(uuidgen)
SIGNATURE=.7480a5c2-dee2-4957-8e9a-9fef190869b1
if [ ! -e ${SIGNATURE} ]
 then echo "you are not in the correct directory"
      exit 1
fi

echo "build rsync"
#setup pathnames
# all paths absolute
RSYNC_HOME=${PWD}
echo "RSYNC_HOME=${RSYNC_HOME}"
echo "script ${0}"

RSYNC_SRC=${RSYNC_HOME}/../../resources/rsync-3.1.2/
RSYNC_BUILD=${RSYNC_HOME}/rsync-build

if [ ! -e ${RSYNC_BUILD} ]
 then mkdir ${RSYNC_BUILD}
fi
#-jn
# n the number of cpu's
MAKE="make -j8"
cd ${RSYNC_BUILD}
${RSYNC_SRC}/configure --prefix=${RSYNC_HOME}
${MAKE}
