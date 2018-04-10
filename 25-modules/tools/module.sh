#-------------------------
#module.sh
#(c) H.Buchmann FHNW 2012
#see http://www.tldp.org/LDP/lkmpg/2.6/html/x181.html
# TODO
#   separate host system from target system
#-------------------------
#before switching from host to target or vice versa
# make clean

##---------------------- for host system
#export KERNEL=/lib/modules/$(uname -r)/build
#make -j $(getconf _NPROCESSORS_ONLN) \
#-C ${KERNEL} V=1 M=${PWD}/src ${@}

#---------------------- for target system
PREFIX=arm-linux-gnueabihf
#export KERNEL=${PWD}/kernel-devel
DOCKER=${HOME}/devel/docker/
export KERNEL=${DOCKER}/kernel-devel
make  -j $(getconf _NPROCESSORS_ONLN) -C ${KERNEL} \
     ARCH=arm \
     V=0 \
     CROSS_COMPILE=${DOCKER}/tc/bin/${PREFIX}- \
     M=${PWD}/src $@
