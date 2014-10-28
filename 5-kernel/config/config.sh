#---------------------
#config.sh
#(c) H.Buchmann FHNW 2014
#---------------------
#we are in 5-kernel
PREFIX=armv6l-unknown-linux-gnueabihf-
TC=../../toolchain/target/tc/bin/
CROSS_COMPILE=${TC}/${PREFIX}
LINUX_SRC=../resources/kernel/linux
#-jn  n:the number of cpus on your host+1 
MAKE="make -j3"


