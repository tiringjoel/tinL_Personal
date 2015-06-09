/*-------------------------
  simple-irq
  (c) H.Buchmann FHNW 2014
  - writing to hardware
  - reading waiting for a change
      transfer from foreground to background with a tasklet
      foreground: interrupts
      background: normal thread of execution
 [1] Embedded Peripheral IP User Guide
     manuals/ug_embedded_ip.pdf
 --------------------------*/
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>

#include <asm/io.h>
#include <linux/interrupt.h>
#include <linux/fs.h>
#include <linux/sched.h>

#include "simple-hw.h"

#define DEVICE "simple_hw"

/*-------------------------------------------------------the hardware */
/* #define GPIO_BASE 0x20200000 already defined */
#define GPIO_SIZE (0x4*(1<<10))                            /* one page */
/*      http://www.airspayce.com/mikem/bcm2835/bcm2835_8h_source.html 
                                                            Table 6.1 */
#define PIN 35
typedef struct
{
 unsigned GPFSEL[6]; /* 0x0000 Function Select 0 */
                     /* index pin
		         0    0 9
			 1   10 19
			 2   20 29
			 3   30 39
			 4   40 49
			 5   50 60
		     */
 unsigned RES0   ;   /* 0x0018                      0         1*/
 unsigned GPSET[2];   /* 0x001c Pin Output Set 0 31-0    57  32*/
 unsigned RES1   ;   /* 0x0024 */  
 unsigned GPCLR[2];  /* 0x0028 Pin Output Clear 0 pins 0 ..31*/
 unsigned RES2   ;   /* 0x0030  */
 unsigned GPLEV0 ;   /* 0x0034 Pin Level 0 */
 unsigned GPLEV1 ;   /* 0x0038 Pin Level 1 */
 unsigned RES3   ;   /* 0x003c */
 unsigned GPEDS0 ;   /* 0x0040 Pin Event Detect Status 0 */
 unsigned GPEDS1 ;   /* 0x0044 Pin Event Detect Status 1 */
 unsigned RES4   ;   /* 0x0048 */
 unsigned GPREN0 ;   /* 0x004c Pin Rising Edge Detect Enable 0 */
 unsigned GPREN1 ;   /* 0x0050 Pin Rising Edge Detect Enable 1 */
 unsigned RES5   ;   /* 0x0054 */
 unsigned GPFEN0 ;   /* 0x0058 Pin Falling Edge Detect Enable 0 */
 unsigned GPFEN1 ;   /* 0x005c Pin Falling Edge Detect Enable 1 */
 unsigned RES6   ;   /* 0x0060 */
 unsigned GPHEN0 ;   /* 0x0064 Pin High Detect Enable 0 */
 unsigned GPHEN1 ;   /* 0x0068 Pin High Detect Enable 1 */
 unsigned RES7   ;   /* 0x006c */
 unsigned GPLEN0 ;   /* 0x0070 Pin Low Detect Enable 0 */
 unsigned GPLEN1 ;   /* 0x0074 Pin Low Detect Enable 1 */
 unsigned RES8   ;   /* 0x0078 */
 unsigned GPAREN0;   /* 0x007c Pin Async. Rising Edge Detect 0 */
 unsigned GPAREN1;   /* 0x0080 Pin Async. Rising Edge Detect 1 */
 unsigned RES9   ;   /* 0x0084 */
 unsigned GPAFEN0;   /* 0x0088 Pin Async. Falling Edge Detect 0 */
 unsigned GPAFEN1;   /* 0x008c Pin Async. Falling Edge Detect 1 */
 unsigned RES10  ;   /* 0x0090 */
 unsigned GPPUD  ;   /* 0x0094 Pin Pull-up/down Enable */
 unsigned GPPUDCLK0; /* 0x0098 Pin Pull-up/down Enable Clock 0 */
 unsigned GPPUDCLK1; /* 0x009c Pin Pull-up/down Enable Clock 1 */
} GPIO;

/*----------------------------------------------------------------- globals */
GPIO* __iomem gpio = 0;                                     /* the hardware */
int device         =-1;

static long simple_hw_ioctl(struct file*  fil, 
                 unsigned      num,  
		 unsigned long param
		 )
{
 printk(KERN_INFO "\nsimple_hw_ioctl gpio=%p num=%x param=%x\n",gpio,num,param);
 switch(num)
 {
  case SIMPLE_HW_PWR_LED:
   if (param)
      {
       gpio->GPSET[PIN/32]=(1<<PIN%32);
      }
      else
      {
       gpio->GPCLR[PIN/32]=(1<<PIN%32);
      }
  return 0;
  
 }
 return EINVAL;
}

/*------------------------------------------------------------------ device */
/* kernelspace -> userspace  */
static struct file_operations fops =                      /* the call backs */
{
 unlocked_ioctl:simple_hw_ioctl,
 compat_ioctl:simple_hw_ioctl
};

static void setAsOutput(void)
{
 unsigned mask= ~(0x7<<(3*(PIN%10)));  /* 000 111 ...000 */
 unsigned v=(gpio->GPFSEL[PIN/10]&mask)|(1<<(3*(PIN%10)));
/*  PESL as output */
 gpio->GPFSEL[PIN/10]=v;
}

static int __init hw_init(void)
{
 device = register_chrdev(0, DEVICE, &fops);
 printk(KERN_INFO DEVICE " device= %d\n",device);
 gpio   =(GPIO* __iomem)ioremap(GPIO_BASE,GPIO_SIZE);     /* reserve memory */
 setAsOutput();
 return 0;
}

static void __exit hw_exit(void)
{
 printk(KERN_INFO "exit: "DEVICE "\n");
 unregister_chrdev(device,DEVICE);
 iounmap(gpio);
}

module_init(hw_init);  
module_exit(hw_exit);
