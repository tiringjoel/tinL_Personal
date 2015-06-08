#----------------------
#Makefile 
#(c) H.Buchmann FHNW 2015
#----------------------
#-------------------- add here your modules
obj-m += simple-module.o simple-device.o simple-ioctl.o simple-hw.o
#stmpe_device.o

all:
	make -C${KERNEL}  M=${PWD} modules
clean:
	make -C${KERNEL}  M=$(PWD) clean
	rm -f call-ioctl
