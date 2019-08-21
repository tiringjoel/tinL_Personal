U-Boot
------
setenv kernel 'ext4load mmc 0:2 0x82000000 boot/zImage;ext4load mmc 0:2 0x88000000 m335x-boneblack-wireless.dtb'
setenv bootargs 'root=/dev/mmcblk0p2 rw rootdelay=1 init=linuxrc console=ttyO0,115200n8'
setenv bootcmd 'run kernel;bootz 0x82000000 -  0x88000000'
