//--------------------------
//led
//(c) H.Buchmann FHNW 2015
//--------------------------
#include "mmap.h"
#include <iostream>

/* http://www.airspayce.com/mikem/bcm2835/bcm2835_8h_source.html */
/* Table 6.1 */

struct GPIO
{
 unsigned GPFSEL0;   /* 0x0000 Function Select 0 */
 unsigned GPFSEL1;   /* 0x0004 Function Select 1 */
 unsigned GPFSEL2;   /* 0x0008 Function Select 2 */
 unsigned GPFSEL3;   /* 0x000c Function Select 3 */
 unsigned GPFSEL4;   /* 0x0010 Function Select 4 */
 unsigned GPFSEL5;   /* 0x0014 Function Select 5 */
 unsigned RES0   ;   /* 0x0018  */
 unsigned GPSET0 ;   /* 0x001c Pin Output Set 0 */
 unsigned GPSET1 ;   /* 0x0020 Pin Output Set 1 */
 unsigned GPCLR0 ;   /* 0x0028 Pin Output Clear 0 */
 unsigned GPCLR1 ;   /* 0x002c Pin Output Clear 1 */
 unsigned RES1   ;   /* 0x0030  */
 unsigned GPLEV0 ;   /* 0x0034 Pin Level 0 */
 unsigned GPLEV1 ;   /* 0x0038 Pin Level 1 */
 unsigned RES2   ;   /* 0x003c */
 unsigned GPEDS0 ;   /* 0x0040 Pin Event Detect Status 0 */
 unsigned GPEDS1 ;   /* 0x0044 Pin Event Detect Status 1 */
 unsigned RES3   ;   /* 0x0048 */
 unsigned GPREN0 ;   /* 0x004c Pin Rising Edge Detect Enable 0 */
 unsigned GPREN1 ;   /* 0x0050 Pin Rising Edge Detect Enable 1 */
 unsigned RES4   ;   /* 0x0054 */
 unsigned GPFEN0 ;   /* 0x0058 Pin Falling Edge Detect Enable 0 */
 unsigned GPFEN1 ;   /* 0x005c Pin Falling Edge Detect Enable 1 */
 unsigned RES5   ;   /* 0x0060 */
 unsigned GPHEN0 ;   /* 0x0064 Pin High Detect Enable 0 */
 unsigned GPHEN1 ;   /* 0x0068 Pin High Detect Enable 1 */
 unsigned RES6   ;   /* 0x006c */
 unsigned GPLEN0 ;   /* 0x0070 Pin Low Detect Enable 0 */
 unsigned GPLEN1 ;   /* 0x0074 Pin Low Detect Enable 1 */
 unsigned RES7   ;   /* 0x0078 */
 unsigned GPAREN0;   /* 0x007c Pin Async. Rising Edge Detect 0 */
 unsigned GPAREN1;   /* 0x0080 Pin Async. Rising Edge Detect 1 */
 unsigned RES8   ;   /* 0x0084 */
 unsigned GPAFEN0;   /* 0x0088 Pin Async. Falling Edge Detect 0 */
 unsigned GPAFEN1;   /* 0x008c Pin Async. Falling Edge Detect 1 */
 unsigned RES9   ;   /* 0x0090 */
 unsigned GPPUD  ;   /* 0x0094 Pin Pull-up/down Enable */
 unsigned GPPUDCLK0; /* 0x0098 Pin Pull-up/down Enable Clock 0 */
 unsigned GPPUDCLK1; /* 0x009c Pin Pull-up/down Enable Clock 1 */
}; 


class LED
{
 public:
  LED(int argc,char** args);
 private:
  const int argc;
  const char*const*const args;  
};

LED::LED(int argc,char** args)
:argc(argc)
,args(args)
{
 Mem m(0x20200000,0x1000);
 GPIO* gpio=(GPIO*)m.mem();
 gpio->GPSET1=(1<<3)|(1<<15);
}


int main(int argc,char** args)
{
 LED led(argc,args);
 return 0;
}
