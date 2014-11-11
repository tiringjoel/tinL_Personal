#------------------
#make.sh
#(c) H.Buchmann FHNW 2014
#------------------
#we are in 7-startup
. config/config.sh
cd u-boot
make CROSS_COMPILE=${CROSS_COMPILE} ${@}

