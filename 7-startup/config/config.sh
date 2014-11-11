#---------------------
#config.sh
#(c) H.Buchmann FHNW 2014
#---------------------
#we are in 7-startup
PREFIX=armv6l-unknown-linux-gnueabihf-
TC=${PWD}/tc/bin/
CROSS_COMPILE=${TC}/${PREFIX}
#-jn  n:the number of cpus on your host+1 
MAKE="make -j3"


