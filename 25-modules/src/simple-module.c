/*---------------------------
  simple-module
  (c) H.Buchmann FHNW 2012
  Documentation/kbuild/modules.txt
 ----------------------------*/
#if 1

#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>
#endif

static int* p=0; /* pointer to nothing */
#if 1
static int __init simple_init(void) /* local call-back function */
{
 printk(KERN_INFO "init: >>>simple-module<<<\n");
/* 
 printk(KERN_INFO "init: >>>simple-module<<< %d\n",*p);
*/
            /*   ^ concatentaion */
 return 0;
}

static void __exit simple_exit(void) /* local call-back function */
{
 printk(KERN_INFO "exit: >>>simple-module<<<\n");
}

module_init(simple_init);  /* register  :  called by kernel */
module_exit(simple_exit);  /* deregister:  called by kernel*/
#endif
