#---------------------
#config.sh
#(c) H.Buchmann FHNW 2014

#---------------------
#we are in 5-kernel
PREFIX=arm-linux-gnueabihf-
TC=${PWD}/tc/bin/
CROSS_COMPILE=${TC}/${PREFIX}

#----------------------- adapt for your needs
VERSION=4.19
#LINUX_SRC=/opt/resources/beaglebone/linux
#LINUX_SRC=/opt/resources/beaglebone/linux-${VERSION}
#                                  2020-03-13 not yet working
LINUX_SRC=/opt/resources/beaglebone/linux-${VERSION}
BUILD=$(pwd)/build-${VERSION}
MODULES=$(pwd)/modules-${VERSION}

MAKE="make -j $(getconf _NPROCESSORS_ONLN)"

#MAKE="make"


