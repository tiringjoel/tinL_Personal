#pragma once
/*-----------------------
  simple-ioctl.h
  (c) H.Buchmann FHNW 2012
  $Id$
  see Documentation/ioctl/ioctl-number.txt
      Documentation/ioctl/ioctl-decoding.txt 
-------------------------*/
#include <linux/ioctl.h>

/* 0 led off
   1 led on 
*/   
#define SIMPLE_HW_PWR_LED _IOW(0x23,5,int)  
