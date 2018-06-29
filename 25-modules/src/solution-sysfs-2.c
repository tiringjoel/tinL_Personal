/*---------------------------
  sysfs-2 read/write
  (c) H.Buchmann FHNW 2018
  Documentation/kbuild/modules.txt
 ----------------------------*/

#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/kobject.h>
#include <linux/sysfs.h>

static struct kobject* kobj=0;


static ssize_t m_show(struct kobject *kobj, 
               struct kobj_attribute *attr,
               char *buf)
{
 printk("m_show\n");
 return 0;
}

static ssize_t m_store(struct kobject *kobj, 
                struct kobj_attribute *attr,
	        const char *buf, size_t count)
{
 printk("m_store\n");
 print_hex_dump(""," ",0,16,1,buf,count,1);
 return count;
}

struct kobj_attribute kobj_attr=
{
 attr: {name:"file",
        mode:0644},
 show :&m_show,
 store:&m_store
};

static int __init _init_(void) 
{
 printk("init: >>>sysfs-2<<<\n");
 kobj=kobject_create_and_add("my-kobj",
                              0); /* in /sys */

 int res=sysfs_create_file(kobj,
                          &kobj_attr.attr
                          );
 printk("sysfs_create_file res=%d\n",res);
 return 0;
}

static void __exit _exit_(void) 
{
 printk("exit: >>>sysfs-2<<<\n");
 kobject_put(kobj);
}

MODULE_LICENSE("GPL");
module_init(_init_);  
module_exit(_exit_);  
