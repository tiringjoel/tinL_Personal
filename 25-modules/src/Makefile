#----------------------
#Makefile 
#(c) H.Buchmann FHNW 2015
#we are in src 
# TODO change so that all works in work
#see http://www.tldp.org/LDP/lkmpg/2.6/html/x181.html
#----------------------
#KERNEL=/lib/modules/4.14.9-1-ARCH/build/
#KERNEL=${PWD}/../../5-kernel/build
#-------------------- add here your modules
obj-m += simple-module.o 
#obj-m += simple-device.o

all:
	make V=1  -C${KERNEL} M=${PWD} modules
clean:
	make -C${KERNEL}  M=$(PWD) clean
	rm -f call-ioctl
