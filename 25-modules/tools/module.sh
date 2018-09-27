#-------------------------
#module.sh
#(c) H.Buchmann FHNW 2012
#see http://www.tldp.org/LDP/lkmpg/2.6/html/x181.html
# TODO
#   separate host system from target system
#-------------------------
#before switching from host to target or vice versa
# make clean

#---------------------- for host system
#export KERNEL=/lib/modules/$(uname -r)/build
#make -j $(getconf _NPROCESSORS_ONLN) \
#-C ${KERNEL} V=0 M=${PWD}/src ${@}

#---------------------- for target system
PREFIX=arm-linux-gnueabihf
export KERNEL=${PWD}/../18-resume/build/kernel/
#DOCKER=${HOME}/devel/docker/
#export KERNEL=${DOCKER}/kernel-devel

make  -j $(getconf _NPROCESSORS_ONLN) -C ${KERNEL} \
     ARCH=arm \
     V=1 \
     CROSS_COMPILE=${PWD}/tc/bin/${PREFIX}- \
     M=${PWD}/src $@
