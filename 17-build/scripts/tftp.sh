#---------------------
#tftp.sh
#(c) H.Buchmann FHNW 2014
#---------------------
#sudo ifconfig eth0:1 192.168.1.2 up
sudo in.tftpd -l -s $(pwd)/build/kernel/arch/arm/boot/
