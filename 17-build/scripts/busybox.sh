#--------------------
#busybox.sh
#(c) H.Buchmann FHNW 2015
# busybox.sh args
#args 
# help
# menuconfig
# see kernel.sh
#--------------------
#we are in build
. scripts/common.sh
BUSYBOX=${PWD}/busybox
[[ ! -d busybox ]] && 
{ 
 mkdir busybox; 
 [[ -e ${CONFIG}/busybox.config ]] &&
 {
  cp ${CONFIG}/busybox.config ${BUSYBOX}/.config
 }
}
cd ${BUSYBOX_SRC}
#MAKE=make -j1
${MAKE} CONFIG_PREFIX=${SYSROOT} CROSS_COMPILE=${CROSS_COMPILE} V=1 O=${BUSYBOX} ${@}

