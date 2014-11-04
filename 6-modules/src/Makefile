#----------------------
#Makefile 
#(c) H.Buchmann FHNW 2012
#$Id$
#we are in src
#see http://www.tldp.org/LDP/lkmpg/2.6/html/x181.html
#----------------------
obj-m += simple-module.o 

all:
	make -C${KERNEL}  M=${PWD} modules
clean:
	make -C${KERNEL}  M=$(PWD) clean
	rm -f call-ioctl
