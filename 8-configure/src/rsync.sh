#--------------------
#rsync.sh
#(c) H.Buchmann FHNW 2014
#--------------------
#we are in 8-configure
BUILD=build-rsync
SRC=${PWD}/../resources/rsync-3.1.1
PREFIX=${PWD}/work
#if [[ ! -d ${BUILD} ]]
#  then mkdir ${BUILD}
#fi


[[ ! -d ${BUILD} ]] && mkdir ${BUILD}
echo "absolute src-path='${SRC}'s"

cd ${BUILD}
${SRC}/configure --prefix=${PREFIX}

 
