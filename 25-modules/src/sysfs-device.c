/*---------------------------
  sysfs-device
  (c) H.Buchmann FHNW 2018
  Documentation/kbuild/modules.txt
 ----------------------------*/

#include <linux/module.h>
#include <linux/device.h>
#include <linux/sysfs.h>
#include <linux/uaccess.h>

static struct device* dev=0;

static const char Msg[]="a message from sys-device\n";

static ssize_t show_(struct device *dev, 
                     struct device_attribute *attr,
	             char *buf)
{
 printk("show_ 0x%p\n",buf);
 unsigned i=0;
 while(1)
 {
  char ch=Msg[i];
  buf[i]=ch;
  ++i;
  if (ch=='\0') break;
 } 
 return i;
}

static ssize_t store_(struct device *dev, 
                      struct device_attribute *attr,
		      const char *buf, size_t count)
{
 printk("store_\n");
 print_hex_dump(KERN_INFO," ",0,16,1,buf,count,1);
 return count;
}
                      
static struct device_attribute transfer=__ATTR(transfer,0644,show_,store_);

static void addTransfer(void)
{
 int res=sysfs_create_file(&dev->kobj,
                          &transfer.attr); 
 printk("addTransfer res=%d\n",res);
}

static int __init _init_(void) 
{
 printk("init: >>>sysfs-device<<<\n");
 dev=root_device_register("my-dev");
 printk("root_device_register 0x%p\n",dev);
 addTransfer();
 return 0;
}

static void __exit _exit_(void) 
{
 printk(KERN_INFO "exit: >>>sysfs-device<<<\n");
 root_device_unregister(dev);
}

MODULE_LICENSE("GPL");
module_init(_init_);  
module_exit(_exit_);  
