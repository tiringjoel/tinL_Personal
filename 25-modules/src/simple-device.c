/*---------------------------
 simple-device
 (c) H.Buchmann FHNW 2018
 on host: 
  use dmesg -w for tracing the kernel output

 TODO
  proper register in /dev/ 
 ---------------------------*/
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/fs.h>
#include <linux/string.h> /* not the posix string */
#include <linux/uaccess.h>

#define DEVICE "simple_device"

static int Major;  

static const char      Msg[] =DEVICE " file='" __FILE__ "' made on: '" "__DATE__" "'\n";
static const unsigned  MsgLen=sizeof(Msg);  /* incl terminating zero */

/*kernelspace  -> userspace*/
static ssize_t simple_read(struct file* src,
                        char __user *  buffer,
			size_t len,
			loff_t* ofs)
{
/* printk("simple_read len %d= *ofs= %lld buffer*=%p\n",len,*ofs,buffer); */
 unsigned rest=MsgLen-*ofs;
 unsigned l=(len<rest)?len:rest;
 copy_to_user(buffer,Msg+*ofs,l);
 *ofs+=l;
 return l;
}

/* userspace -> kernelspace */
static ssize_t simple_write(struct file* dst, 
                     const char __user* buffer, 
		     size_t len, 
		     loff_t* ofs)
{
 char b[len];
 copy_from_user(b,buffer,len);
 print_hex_dump(KERN_INFO," ",0,16,1,b,len,1);
 return len;
}

/* see linux/fs.h */
static struct file_operations fops =  /* the call backs */
{
  read:simple_read,
 write:simple_write
#if 0
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
