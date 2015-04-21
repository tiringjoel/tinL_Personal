#----------------------
#Makefile 
#(c) H.Buchmann FHNW 2015
#----------------------
#-------------------- add here your modules
obj-m += simple-module.o 

all:
	make -C${KERNEL}  M=${PWD} modules
clean:
	make -C${KERNEL}  M=$(PWD) clean
	rm -f call-ioctl
