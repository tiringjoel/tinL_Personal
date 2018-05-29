/*------------------------------
 gpio-7.c ring buffer
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

#include <linux/semaphore.h>
#include <linux/slab.h>

#define MODULE_NAME "gpio-6"

static struct kobject* kobj    =   0;
static const int       pin49   =  49;
static const int       pin115  = 115;
static       int       irq     =   0;

static struct tasklet_struct tasklet; /* definition */


typedef struct Entry
{
 unsigned        data;
 struct Entry*   next;
} Entry;

#define RINGBUFFER 16 
typedef struct
{
 struct semaphore sema;
 unsigned putI;
 unsigned getI;
 unsigned size; 
 unsigned data[RINGBUFFER];
} RingBuffer;


static void init_ringbuffer(RingBuffer* rb)
{
 sema_init(&rb->sema,0);
 rb->putI=0;
 rb->getI=0;
 rb->size=0;
};

static void put_ringbuffer(RingBuffer* rb,unsigned data)
{
 rb->data[rb->putI++]=data;
 if (rb->putI>=RINGBUFFER)
    { 
     rb->putI=0; /*wrap */
    }
 if (rb->size<RINGBUFFER)
    {
     up(&rb->sema);
     ++rb->size;
    }
}


static unsigned get_ringbuffer(RingBuffer* rb)
{
 down(&rb->sema);
 unsigned d=rb->data[rb->getI++];
 if (rb->getI>=RINGBUFFER)
    { 
     rb->getI=0; /*wrap */
    }
 --rb->size;
 return d; 
}

RingBuffer         switch_;

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
 unsigned data=get_ringbuffer(&switch_);
 buf[0]=(data)?'1':'0';
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
 tasklet.data=gpio_get_value(pin115);
 tasklet_schedule(&tasklet);
 return IRQ_HANDLED;
}


/*------------------------------------------------------------------- tasklet */
/* call-back */
static void onSWITasklet(unsigned long data)     /* *not* called in interrupt */
{
 printk("onSWITasklet\n");
 put_ringbuffer(&switch_,data);
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
 init_ringbuffer(&switch_);
 printk("gpio_request pin=%d res=%d irq=%d\n",pin115,res,irq);
 res=request_irq(irq,onSWI,IRQF_TRIGGER_FALLING|IRQF_TRIGGER_RISING,"swi",0);
 kobj=kobject_create_and_add("my-hw",0);
 
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