#------------------
#make.sh
#(c) H.Buchmann FHNW 2014
# step 1: distclean
#      2: rpi_b_config
#      3: u-boot.bin
#------------------
#we are in 7-startup
. config/config.sh
pushd ${U_BOOT_SRC}
make CROSS_COMPILE=${CROSS_COMPILE} O=${BUILD} ${@}
popd

