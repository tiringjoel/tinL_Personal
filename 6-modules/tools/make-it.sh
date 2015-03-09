#-------------------------
#make-it.sh
#(c) H.Buchmann FHNW 2012
#$Id$
#see http://www.tldp.org/LDP/lkmpg/2.6/html/x181.html
#-------------------------
#we are in 8-module/src
#before switching from host to target or vice versa
# make clean

#---------------------- for host system
#export KERNEL=/lib/modules/$(uname -r)/build
#make -C ${KERNEL} V=1 M=${PWD} ${@}

###---------------------- for target system
PREFIX=armv6l-unknown-linux-gnueabihf
LINUX_SRC=../../resources/kernel/linux/
export KERNEL=../../5-kernel/build
make  -C ${KERNEL} \
     ARCH=arm \
     CROSS_COMPILE=${PWD}/../tc/bin/${PREFIX}- \
     M=${PWD} $@
