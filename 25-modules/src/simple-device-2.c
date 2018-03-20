/*---------------------------
 simple-device-1.c
 (c) H.Buchmann FHNW 2018
 solution
 ---------------------------*/
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/fs.h>
#include <linux/string.h> /* not the posix string */

#define DEVICE "simple_device-2"

static int Major = 0;

/* see linux/fs.h */
static ssize_t simple_read(struct file* src,
                        char __user *  buffer,
			size_t len,
			loff_t* ofs)
{
 unsigned j=0;  /* index in buffer */
 printk("simple_read len %d= *ofs= %lld buffer*=0x%p\n",len,*ofs,buffer);
 return j;
}

static ssize_t simple_write(struct file* dst, 
                     const char __user* buffer, 
		     size_t len, 
		     loff_t* ofs)
{
 printk("simple_write len %d= *ofs= %lld buffer*=0x%p\n",len,*ofs,buffer);
 return len;
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
