#pragma once
/*-----------------------
  simple-ioctl.h
  (c) H.Buchmann FHNW 2012
  see Documentation/ioctl/ioctl-number.txt
      Documentation/ioctl/ioctl-decoding.txt 
-------------------------*/
#include <linux/ioctl.h>

#define SIMPLE_IOCTL_WRITE _IOW(0x23,5,int)  
#define SIMPLE_IOCTL_READ  _IOR(0x23,5,int) 
