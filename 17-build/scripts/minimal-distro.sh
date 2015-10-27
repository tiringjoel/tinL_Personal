#-----------------------
#minimal-distro.sh
#(c) H.Buchmann FHNW 2015
# we are in 17-build
#-----------------------
Mi=$((1<<20))
BOOT=$((16*Mi))
ROOTFS=$((128*Mi))

dd if=/dev/urandom of=minimal-distro.img count=$(((BOOT+ROOTFS)/512))

#fdisk minimal-distro.img
#fdisk -l minimal-distro.img
#partition 1: 16   MiB type 0xb
#partition 2: rest MiB type Linux
#losetup -o $((2048*512)) /dev/loop0 minimal-distro.img
#mkfs.vfat /dev/loop0
#losetup -o $((34816*512)) /dev/loop1 minimal-distro.img
#mkfs.ext4 /dev/loop1
