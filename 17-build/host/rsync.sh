#--------------------
#rsync.sh
#(c) H.Buchmann FHNW 2016
# example
#--------------------
BUILD_HOME=${PWD}

#where are the things use absolute pathnames
RSYNC_SRC=${PWD}/../../resources/rsync-3.1.2
PREFIX=${PWD}
MAKE="make -j8"
cd rsync-build
${RSYNC_SRC}/configure --prefix=${PREFIX}
${MAKE}
