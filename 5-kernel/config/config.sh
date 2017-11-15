#---------------------
#config.sh
#(c) H.Buchmann FHNW 2014

#---------------------
#we are in 5-kernel
PREFIX=arm-linux-gnueabihf-
TC=${PWD}/tc/bin/
CROSS_COMPILE=${TC}/${PREFIX}

#----------------------- adapt for your needs
LINUX_SRC=${PWD}/../resources/linux
BUILD=$(pwd)/build
MODULES=$(pwd)/modules

#-jn  n:the number of cpus on your host+1 
MAKE="make -j8"
#MAKE="make"


