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
PARTTABLE_SIZE_MB=1
BOOTFS=image/boot.fs
BOOTFS_SIZE_MB=17
ROOTFS=image/root.fs
ROOTFS_SIZE_MB=${1}

PARTTABLE_SIZE_SECT=$(((PARTTABLE_SIZE_MB)<<11))
BOOTFS_SIZE_SECT=$(((BOOTFS_SIZE_MB)<<11))
ROOTFS_SIZE_SECT=$(((ROOTFS_SIZE_MB)<<11))

BOOTFS_POS_SECT=${PARTTABLE_SIZE_SECT}
ROOTFS_POS_SECT=$((BOOTFS_POS_SECT+BOOTFS_SIZE_SECT))

#dd if=/dev/urandom of=${IMG} count=${PARTTABLE_SIZE_SECT}
#dd if=/dev/urandom of=${BOOTFS} count=${BOOTFS_SIZE_SECT}
#dd if=/dev/urandom of=${ROOTFS} count=${ROOTFS_SIZE_SECT}
#
#mkfs.vfat ${BOOTFS}
#
#mkfs.ext4 ${ROOTFS}
#
#
#dd if=${BOOTFS} of=${IMG} seek=${BOOTFS_POS_SECT}
#dd if=${ROOTFS} of=${IMG} seek=${ROOTFS_POS_SECT}
#cat<<EOF | sfdisk ${IMG}
#boot :   start=${BOOTFS_POS_SECT} size=      ${BOOTFS_SIZE_MB}MiB, type=b, bootable
#rootfs : start=${ROOTFS_POS_SECT} size=      ${ROOTFS_SIZE_MB}MiB, type=83
#EOF

echo "------------------- $(pwd)"
LOOP_DEV=$(losetup -f)
sudo losetup -f -P ${IMG}
sudo mount ${LOOP_DEV}p1 image/boot-fs
sudo mount ${LOOP_DEV}p2 image/root-fs

sudo cp -v build/kernel/arch/arm/boot/{zImage,dts/am335x-boneblack-wireless.dtb} image/boot-fs
sudo cp -v build/u-boot/{MLO,u-boot.img} image/boot-fs
sudo rsync -av target-root/ image/root-fs
sync
sudo umount image/boot-fs/
sudo umount image/root-fs/
sudo losetup --detach ${LOOP_DEV}

