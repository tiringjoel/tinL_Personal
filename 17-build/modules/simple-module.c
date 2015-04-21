/*---------------------------
  simple-module
  (c) H.Buchmann FHNW 2012
  $Id$
  see http://tldp.org/LDP/lkmpg/2.6/html
  Documentation/kbuild/modules.txt
 ----------------------------*/

#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>


static int __init simple_init(void) /* local call-back function */
{
 printk(KERN_INFO "init: simple-module\n");
            /*   ^ concatentaion */
 return 0;
}

static void __exit simple_exit(void) /* local call-back function */
{
 printk(KERN_INFO "exit: simple-module\n");
}

module_init(simple_init);  /* register  :  called by kernel */
module_exit(simple_exit);  /* deregister:  called by kernel*/
