/*---------------------------
  sysfs
  (c) H.Buchmann FHNW 2018
  Documentation/kbuild/modules.txt
 ----------------------------*/

#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/kobject.h>

static struct kobject* kobj=0;

static ssize_t m_show(struct kobject* kobj,
                     struct kobj_attribute* attr,
                     char* buff) /* capacity PAGE_SIZE
{
 printk("m_show buff=0x%p\n",buff);
 buff[0]='1';
 buff[1]='\0';
}

static ssize_t m_store(struct kobject* kobj,struct kobj_attribute* attr,const char* buff,size_t len)
{
}

static struct kobj_attribute myAttr=__ATTR(myAttr,0644,m_show,m_store);

static struct attribute* attrs[]=
{
 &myAttr.attr,
 0       /* terminates list */
};

static struct attribute_group attr=
{
 .attrs=attrs,   
};

static int __init _init_(void) 
{
 printk("init: >>>sysfs<<<\n");
 kobj=kobject_create_and_add("my-kobj",
                             0); /* in /sys */
 printk("my-kobj: 0x%p\n",kobj);
 int res=sysfs_create_group(kobj,&attr);
 printk("sysfs_create_group res=%d\n",res);
 return 0;
}

static void __exit _exit_(void) 
{
 printk(KERN_INFO "exit: >>>sysfs<<<\n");
 kobject_put(kobj);
}

MODULE_LICENSE("GPL");
module_init(_init_);  
module_exit(_exit_);  
