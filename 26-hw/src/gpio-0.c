/*------------------------------
 gpio-0.c
 using linux/gpio.h
 (c) H.Buchmann FHNW 2018
 -------------------------------*/
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/kobject.h>
#include <linux/sysfs.h>
#include <linux/gpio.h>

static struct kobject* kobj=0;
static const int pin49=49;

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
 switch(buf[0])
 {
  case '1':
   gpio_set_value(pin49,1);
  break;
  case '0':
   gpio_set_value(pin49,0);
  break;
/* TODO implenent toggle */  
 }
 return count;
}

struct kobj_attribute kobj_attr=
{
 attr: {name:"led",
        mode:0222},
 show :&m_show,
 store:&m_store
};


static int __init _init_(void) 
{
 printk("init: >>>gpio-0<<<\n");
 int res=gpio_request(pin49,"");
 printk("gpio_request pin=%d res=%d\n",pin49,res);
 res=gpio_direction_output(pin49,0);
 kobj=kobject_create_and_add("my-hw",0);

 res=sysfs_create_file(kobj,
                       &kobj_attr.attr);
 return 0;
}

static void __exit _exit_(void) 
{
 printk("exit: >>>gpio-0<<<\n");
 gpio_free(pin49);
 kobject_put(kobj);
}

MODULE_LICENSE("GPL");
module_init(_init_);  
module_exit(_exit_);  
