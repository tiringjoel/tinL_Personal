/*----------------------
  userspace-led adapted for button
  (c) H.Buchmann FHNW 2015
  $Id$
  we are in user space
------------------------*/
#include <sys/ioctl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>
#include "simple-hw.h"

static const char* program;

static void usage()
{
 fprintf(stderr,"usage: %s device/file on|off\n",program);
 exit(1);
}

int main(int argc,char** args)
{
 program=args[0];
 if (argc!=3) usage();
 printf("calling IOCTL\n");
 int id=open(args[1],O_RDWR);
 if (id<0)
    {
     perror("open");
     return 1;
    }
 if (strcmp(args[2],"on")==0)
    {
     int res=ioctl(id,SIMPLE_HW_PWR_LED,1)<0;
     if (res<0)
        {
	 perror("SIMPLE_HW_PWR_LED on");
	}
     return res;
    }
 if (strcmp(args[2],"off")==0)
    {
     int res=ioctl(id,SIMPLE_HW_PWR_LED,0)<0;
     if (res<0)
        {
	 perror("SIMPLE_HW_PWR_LED off");
	}
     return res;
    }
 usage();
}
