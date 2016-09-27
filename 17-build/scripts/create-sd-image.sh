#!/bin/bash
#------------------------
#create-sd-image.sh
#(c) H.Buchmann FHNW 2016
#------------------------
SIGNATURE=.4dd6df53-9da5-4819-bbfe-a2b578594228
[[ ! -f ${SIGNATURE} ]] &&
{
 echo " your are not in BUILD_HOME"
 exit 1
}

[[ -z ${1} ]] && { echo "usage ${0} size im MBytes"; exit 1; }
DATE=$(date +'%Y-%m-%d')
IMG=image/sd-${DATE}.img
SIZ_MB=${1}


dd if=/dev/urandom of=${IMG} count=$(((SIZ_MB+17)<<11))

cat<<EOF | sfdisk ${IMG}
boot :   size=      16MiB, type=b, bootable
rootfs : size=     ${SIZ_MB}MiB, type=83
EOF

PART1=${IMG}1
PART2=${IMG}2
START1=$(partx -g -oSTART ${PART1} ${IMG})
START2=$(partx -g -oSTART ${PART2} ${IMG})
LOOP=$(sudo losetup -f)

sudo losetup -o $((START1*512)) ${LOOP} ${IMG}
sudo mkfs.vfat -nBOOT ${LOOP}
sudo mount ${LOOP} image/mount
sudo cp -v build/kernel/arch/arm/boot/zImage image/mount
sudo cp -v build/kernel/arch/arm/boot/dts/am335x-boneblack.dtb image/mount
sudo cp -v build/u-boot/MLO image/mount
sudo cp -v build/u-boot/u-boot.img image/mount
sudo umount image/mount
sudo losetup -D

sudo losetup -o $((START2*512)) ${LOOP} ${IMG}
sudo mkfs.ext4 -Lrootfs ${LOOP}
sudo mount ${LOOP} image/mount
sudo rsync -av target-root/ image/mount
sudo umount image/mount
sudo losetup -D
