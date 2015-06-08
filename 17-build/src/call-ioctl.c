/*----------------------
  call-ioctl adapted for button
  (c) H.Buchmann FHNW 2012
  $Id$
  we are in user space
------------------------*/
#include <sys/ioctl.h>
#include <stdio.h>
#include <fcntl.h>
#include "simple-ioctl.h"

int main(int argc,char** args)
{
 if (argc!=2)
    {
     fprintf(stderr,"usage %s device/file\n",args[0]);
     return 1;
    } 
 printf("calling IOCTL\n");
 int id=open(args[1],O_RDWR);
 if (id<0)
    {
     perror("open");
     return 1;
    }
 
#if 0
 int res=ioctl(id,SIMPLE_IOCTL_WRITE,0x1234);
 if (res<0)
    {
     perror("ioctl-write");
    }
#endif
 int val;
 int res=ioctl(id,SIMPLE_IOCTL_READ,&val);
 if (res<0)
    {
     perror("ioctl-read");
    }
 printf("val=%x\n",val);
 return 0;
}

