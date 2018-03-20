/*---------------------------
 simple-device-2.c
 (c) H.Buchmann FHNW 2018
 your work
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
}

static ssize_t simple_write(struct file* dst, 
                     const char __user* buffer, 
		     size_t len, 
		     loff_t* ofs)
{
}

static struct file_operations fops =  /* the call backs */
{
/* register call-backs */

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
