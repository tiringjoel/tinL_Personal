/*------------------------------
 gpio-5.c semaphore
 using linux/gpio.h
 (c) H.Buchmann FHNW 2018
 -------------------------------*/
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/kobject.h>
#include <linux/sysfs.h>
#include <linux/gpio.h>
#include <linux/interrupt.h>

#include <linux/wait.h>
#include <linux/slab.h>

#define MODULE_NAME "gpio-5"

static struct kobject* kobj    =   0;
static const int       pin49   =  49;
static const int       pin115  = 115;
static       int       irq     =   0;
static       unsigned  swiN    =   0; /* the number of switchings */  

static struct tasklet_struct tasklet; /* definition */
static wait_queue_head_t      queue;
/* static struct wait_queue_head queue;  works too */

static ssize_t get_led(struct kobject *kobj, 
               struct kobj_attribute *attr,
               char *buf)
{
/* return current value */
 printk("get_led\n");
 return 0;
}

static ssize_t set_led(struct kobject *kobj, 
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

static ssize_t get_swi(struct kobject *kobj, 
               struct kobj_attribute *attr,
               char *buf)
{
 wait_event_interruptible(queue,swiN>0);
 --swiN;
 unsigned val=gpio_get_value(pin115);
 buf[0]=(val)?'1':'0';
 return 1;
}

struct kobj_attribute led=
{
 attr: {name:"led",
        mode:0666},
 show :&get_led,
 store:&set_led
};

struct kobj_attribute swi=
{
 attr: {name:"swi",
        mode:0444},
 show :&get_swi,
};


static  irqreturn_t onSWI(int id,void* d)
{
 printk("onSWI\n");
 gpio_set_value(pin49,gpio_get_value(pin115));
 tasklet_schedule(&tasklet);
 return IRQ_HANDLED;
}


/*------------------------------------------------------------------- tasklet */
/* call-back */
static void onSWITasklet(unsigned long data)     /* *not* called in interrupt */
{
 printk("onSWITasklet\n");
 ++swiN;
 wake_up_interruptible(&queue);
}

static int __init _init_(void) 
{
 printk("init: " MODULE_NAME "\n");
 int res=gpio_request(pin49,"");
 printk("gpio_request pin=%d res=%d\n",pin49,res);
 res=gpio_direction_output(pin49,0);
 res=gpio_request(pin115,"");
 gpio_direction_input(pin115);
 irq=gpio_to_irq(pin115);
 tasklet_init(&tasklet,onSWITasklet,0);
 
 printk("gpio_request pin=%d res=%d irq=%d\n",pin115,res,irq);
 res=request_irq(irq,onSWI,IRQF_TRIGGER_FALLING|IRQF_TRIGGER_RISING,"swi",0);
 kobj=kobject_create_and_add("my-hw",0);

 init_waitqueue_head(&queue);

 res=sysfs_create_file(kobj,&led.attr);
 res=sysfs_create_file(kobj,&swi.attr);
 return 0;
}

static void __exit _exit_(void) 
{
 printk("exit: " MODULE_NAME "\n");
 free_irq(irq,0);
 gpio_free(pin49);
 gpio_free(pin115);
 kobject_put(kobj);
}

MODULE_LICENSE("GPL");
module_init(_init_);  
module_exit(_exit_);  
