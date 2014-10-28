#---------------------
#make.sh
#(c) H.Buchmann FHNW 2014
# make.sh args-for-make
# make.sh help
#---------------------
#we are in 5-kernel
. config/config.sh
BUILD=$(pwd)/build
cd ${LINUX_SRC}
${MAKE} V=1 O=${BUILD} \
ARCH=arm \
CROSS_COMPILE=${CROSS_COMPILE} \
${@}
