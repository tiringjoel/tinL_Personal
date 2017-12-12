/*---------------------------
  led-demo
  (c) H.Buchmann FHNW 2015
  leds:
   USR0,1,2,3
   do not work with Linux (none) 4.4.19
  ---------------------------*/
#include <stdio.h>
#include <fcntl.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <unistd.h>
#include <time.h>
/* from device tree: */
#define DT_GPIO1 0x44e07000 /* no crash no leds */
#define DT_GPIO2 0x4804c000 /* crash */
#define DT_GPIO3 0x481ac000 /* crash */
#define DT_GPIO4 0x481ae000 /* crash */

/* a 4KiB boundary */
#define GPIO1 DT_GPIO2

#define REV          (0x000/sizeof(unsigned))
#define OE           (0x134/sizeof(unsigned))
#define CLEARDATAOUT (0x190/sizeof(unsigned))
#define SETDATAOUT   (0x194/sizeof(unsigned))
#define USR0 (1<<21)
#define USR1 (1<<22)
#define USR2 (1<<23)
#define USR3 (1<<24)
#define SECOND 1000000000l

int main(int argc,char** args)
{ 
 printf("----------- led-demo ------\n");
 int memId=open("/dev/mem",O_RDWR|O_SYNC);
 perror("open");
 unsigned * mem=(unsigned*)mmap(0, /* addr hint */
			         0x1000,                     /* 4KiB */
			         PROT_READ|PROT_WRITE,
			         MAP_PRIVATE, 
			         memId,
			         GPIO1);
 perror("mmap");
 printf("mem=%p\n",mem);
 printf("rev=%x\n",mem[REV]);
 return 0;

 mem[OE]&=~(USR0|USR1|USR2|USR3);       /* set as output */
 mem[SETDATAOUT]=(USR0|USR1|USR2|USR3);
 struct timespec tick;
 tick.tv_sec=0;
 tick.tv_nsec= SECOND/2;
 while(1)
 {
  mem[SETDATAOUT] =(USR0|USR1|USR2|USR3);
  nanosleep(&tick,0);
  printf("tick\n");
  mem[CLEARDATAOUT]=(USR0|USR1|USR2|USR3);
  nanosleep(&tick,0);
  printf("tack\n");
 }
 
 return 0;
}
