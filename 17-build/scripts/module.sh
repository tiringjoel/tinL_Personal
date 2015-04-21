#-------------------------
#module.sh
#(c) H.Buchmann FHNW 2015
#-------------------------
#we are in 17-build
SIGNATURE=.4dd6df53-9da5-4819-bbfe-a2b578594228

[[ ! -f ${SIGNATURE} ]] &&
{
 echo " your are not in BUILD_HOME"
 exit 1
}
KERNEL=${PWD}/build/kernel
TARGET=arm-fhnw-linux-gnueabi
CROSS_COMPILE=${PWD}/tc/bin/${TARGET}-
cd modules

###---------------------- for target system
make  -C ${KERNEL} \
     ARCH=arm \
     CROSS_COMPILE=${CROSS_COMPILE} \
     M=${PWD} $@
