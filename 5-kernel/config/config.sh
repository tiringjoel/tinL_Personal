#---------------------
#config.sh
#(c) H.Buchmann FHNW 2014

#---------------------
#we are in 5-kernel
PREFIX=arm-linux-gnueabihf-
TC=${PWD}/tc/arm-linux-gnueabihf/bin/
CROSS_COMPILE=${TC}/${PREFIX}

#----------------------- adapt for your needs
LINUX_SRC=${HOME}/Desktop/tinL1/tinL_own/resources/linux
BUILD=$(pwd)/build
MODULES=$(pwd)/modules

MAKE="make -j $(getconf _NPROCESSORS_ONLN)"

#MAKE="make"


