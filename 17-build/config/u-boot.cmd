u-boot simple configuration
---------------------------
load via copy paste

setenv bootargs 'root=/dev/mmcblk0p2 rw rootdelay=1 init=linuxrc console=ttyO0,115200n8'
setenv bootcmd 'run kernel;bootz 0x82000000 -  0x88000000'
setenv kernel 'ext4load mmc 0:2 0x82000000 boot/zImage;ext4load mmc 0:2 0x88000000 boot/am335x-boneblack-wireless.dtb'
saveenv