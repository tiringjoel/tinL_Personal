/*---------------------------
  sysfs-1 create file
  (c) H.Buchmann FHNW 2018
  Documentation/kbuild/modules.txt
 ----------------------------*/

#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/kobject.h>
#include <linux/sysfs.h>

static struct kobject* kobj=0;


static struct attribute attr=
{
};

static int __init _init_(void) 
{
 printk("init: >>>sysfs-1<<<\n");
 int res=0;
 printk("sysfs_create_file res=%d\n",res);
 return 0;
}

static void __exit _exit_(void) 
{
 printk("exit: >>>sysfs-1<<<\n");
 kobject_put(kobj);
}

MODULE_LICENSE("GPL");
module_init(_init_);  
module_exit(_exit_);  
