/*------------------------------
 gpio-1.c
 using linux/gpio.h
 (c) H.Buchmann FHNW 2018
 -------------------------------*/
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/kobject.h>
#include <linux/sysfs.h>
#include <linux/gpio.h>
#include <asm/io.h>

#include "gpio.h"

static struct kobject* kobj  =0;
static const int       pin49 =(49-32);
static GPIO* __iomem   gpio1 = 0;

static ssize_t m_show(struct kobject *kobj, 
               struct kobj_attribute *attr,
               char *buf)
{
/* return current value */
 printk("m_show\n");
 return 0;
}

static ssize_t m_store(struct kobject *kobj, 
                struct kobj_attribute *attr,
                const char *buf, size_t count)
{
 
 return count;
}

struct kobj_attribute kobj_attr=
{
 attr: {name:"led",
        mode:0666},
 show :&m_show,
 store:&m_store
};


static int __init _init_(void) 
{
 printk("init: >>>gpio-1<<<\n");
 return 0;
}

static void __exit _exit_(void) 
{
 printk("exit: >>>gpio-1<<<\n");
}

MODULE_LICENSE("GPL");
module_init(_init_);  
module_exit(_exit_);  
