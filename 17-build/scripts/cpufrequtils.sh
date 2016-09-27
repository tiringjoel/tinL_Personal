#--------------------
#cpufrequtils.sh
#(c) H.Buchmann FHNW 2015
#--------------------
#we are in build
. scripts/common.sh
CPUFREQUTILS=${PWD}/cpufrequtils
[[ ! -d cpufrequtils ]] && 
{ 
 mkdir cpufrequtils
}
cd ${BUSYBOX_SRC}
#MAKE=make -j1
${MAKE} CONFIG_PREFIX=${SYSROOT} CROSS_COMPILE=${CROSS_COMPILE} V=1 O=${BUSYBOX} ${@}

