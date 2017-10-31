/*---------------------------
 simple-device
 (c) H.Buchmann FHNW 2012
 $Id
 see http://tldp.org/LDP/lkmpg/2.6/html
 ---------------------------*/
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/fs.h>
#include "simple-ioctl.h"

#define DEVICE "simple_ioctl"
static int Major;  

static long simple_ioctl(struct file*  fil, 
                 unsigned      num,  
		 unsigned long param
		 )
{
 printk(KERN_INFO "\nsimple_ioctl num=%x param=%x\n",num,param);
 switch(num)
 {
  case SIMPLE_IOCTL_WRITE:
   
  return 0;
  
  case SIMPLE_IOCTL_READ:
   *(int*)param=0x1234;
  return 0;
 }
 return EINVAL;
}
			
static struct file_operations fops =  /* the call backs */
{
 unlocked_ioctl:simple_ioctl,
 compat_ioctl:simple_ioctl
#if 0
 read:simple_read,
 write:simple_write
 open:simple_open,
#endif 
};

/* register/deregister of module */
static int __init _init_(void) /* local call-back function */
                        /* the compiler wants this (void) */
{
 Major = register_chrdev(0, DEVICE, &fops);
 printk(KERN_INFO "init: " DEVICE " Major=%d\n",Major);
            /*   ^ concatenation */
 return 0;
}

static void __exit _exit_(void) /* local call-back function */
                        /* the compiler wants this (void) */
{
 unregister_chrdev(Major,DEVICE);
 printk(KERN_INFO "exit: " DEVICE "\n");
}

module_init(_init_);
module_exit(_exit_);
