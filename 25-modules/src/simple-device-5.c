/*---------------------------
 simple-device-5.c
 (c) H.Buchmann FHNW 2018
 ---------------------------*/
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/fs.h>
#include <linux/string.h> /* not the posix string */

#include <linux/uaccess.h> 
#include <linux/device.h>

#define DEVICE "simple_device-5"
MODULE_LICENSE ("GPL");

static int Major = 0;
static struct class*  simple_class=0;
static struct device* dev         =0;

static char Msg[]="Data from kernel-space --A\n"
                  "Data from kernel-space --B\n"
                  "Data from kernel-space --C\n"
                  "Data from kernel-space --D\n"
                  "Data from kernel-space --E\n"
                  "End\n";
static unsigned MsgLen=sizeof(Msg); /* incl. implicit terminating zero */

/* see linux/fs.h */
static ssize_t simple_read(struct file* src,
                        char __user *  buffer,
			size_t len,
			loff_t* ofs)
{
/*
           0                                                    len
 buffer = |  |  |  |  |  |  |  |  |....|  |  |  |  |  |  |  |  |eob|
 
 ofs        0                                                    
 src   =  |  |  |  |  |  |  |  |  |....|  |  |  |  |  |  |  |  |eod|
*/
 printk("simple_read len %d= *ofs= %lld buffer*=0x%p\n",len,*ofs,buffer);
 unsigned rest=MsgLen-*ofs;
 unsigned l=(rest<=len)?rest:len;
 copy_to_user(buffer,Msg+*ofs,l);
 *ofs=*ofs+l;    
 return l;
}

static ssize_t simple_write(struct file* dst, 
                     const char __user* buffer, 
		     size_t len, 
		     loff_t* ofs)
{
 printk("simple_write len %d= *ofs= %lld buffer*=0x%p\n",len,*ofs,buffer);
#define TRANSFER 4
 char transfer[TRANSFER];
 unsigned rest=len-*ofs;
 unsigned l=(rest<=TRANSFER)?rest:TRANSFER;
 copy_from_user(transfer,buffer,l);
 *ofs=*ofs+l;
 print_hex_dump(KERN_INFO," ",0,16,1,transfer,l,1);
 return l;
 
}

static struct file_operations fops =  /* the call backs */
{
 read :simple_read, /* register call-backs */
 write:simple_write,
};

/* register/deregister of module */
static int __init _init_(void) /* local call-back function */
                        /* the compiler wants this (void) */
{
 simple_class=class_create(THIS_MODULE,"simple_device");
 Major = register_chrdev(0, DEVICE, &fops);
 printk(KERN_INFO "init: " DEVICE " Major=%d simple_class=%p\n",Major,simple_class);
 return 0;
}

static void __exit _exit_(void) /* local call-back function */
                        /* the compiler wants this (void) */
{
 unregister_chrdev(Major,DEVICE);
 class_destroy(simple_class);
 printk(KERN_INFO "exit: " DEVICE "\n");
}

module_init(_init_);
module_exit(_exit_);
