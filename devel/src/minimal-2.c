/*--------------------
 minimal-2
 (c) H.Buchmann FHNW 2011
 $Id$
----------------------*/
#include <stdio.h>
#include <unistd.h>
#include <time.h>
#define SECOND 1000000000
int main(int argc,char** args)
{
 
 unsigned tickN=0;
 printf("Hello World %s\n",__FILE__);
 struct timespec tick={0, /* 0 seconds */
                       SECOND/4
                      };
 while(tickN<20)
 {
  printf("Tick %d\n",tickN++);
  nanosleep(&tick,0);
 }
 return 0;
}
  
