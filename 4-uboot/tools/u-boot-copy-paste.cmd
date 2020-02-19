fatls mmc 0
fatload
setenv xtest 'f1db7446-0dd8-499e-a34b-cc7fba3f6430'
fatload mmc 0 0x82000000 zimage
fatload mmc 0 0x88000000 m335x-boneblack-wireless.dtb

setenv kernel 'ext4load mmc 0:2 0x82000000 boot/zImage;ext4load mmc 0:2 0x88000000 boot/m335x-boneblack-wireless.dtb'
setenv bootargs 'root=/dev/mmcblk0p2 rw rootdelay=1 init=linuxrc console=ttyO0,115200n8'
setenv bootcmd 'run kernel;bootz 0x82000000 -  0x88000000'
