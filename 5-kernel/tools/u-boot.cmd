U-Boot commands
---------------

fatload mmc 0 0x82000000 zimage;
fatload mmc 0 0x88000000 am335x-boneblack.dtb 
setenv bootargs 'root=/dev/mmcblk0p2 rw rootdelay=1 init=linuxrc console=ttyO0,115200n8';
bootz 0x82000000 -  0x88000000

#the environment
setenv kernel 'fatload mmc 0 0x82000000 zimage;fatload mmc 0 0x88000000 am335x-boneblack.dtb'
setenv bootargs 'root=/dev/mmcblk0p2 rw rootdelay=1 init=linuxrc console=ttyO0,115200n8'
setenv bootcmd 'run kernel;bootz 0x82000000 -  0x88000000'
