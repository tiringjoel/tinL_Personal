/*---------------------------
  sysfs-0 create kobject
  (c) H.Buchmann FHNW 2018
  Documentation/kbuild/modules.txt
 ----------------------------*/

#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/kobject.h>

static struct kobject* kobj=0;

static int __init _init_(void) 
{
 printk("init: >>>sysfs-0<<<\n");
 kobj=kobject_create_and_add("my-kobj",
                             0); /* in /sys */
 printk("my-kobj: 0x%p\n",kobj);
 return 0;
}

static void __exit _exit_(void) 
{
 printk(KERN_INFO "exit: >>>sysfs-0<<<\n");
 kobject_put(kobj);
}

MODULE_LICENSE("GPL");
module_init(_init_);  
module_exit(_exit_);  
