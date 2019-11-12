/*------------------------
  s-bare-init
  (c) H.Buchmann FHNW 2019
  see man page syscall
   Architecture calling convention for arm/EABI

  using syscall for
    ssize_t write(int fildes, const void *buf, size_t nbyte)
            |     |           |                |
	    |     |           |                r2
	    |     |           r1
	    |     r0            
           r7 see syscall.h
 
  copy executable to target-root/linuxrc	  
  kernel parameter   
    console=ttyAMA0,115200 root=/dev/mmcblk0p3 rootfstype=ext4 rootwait init=/linuxrc
  ------------------------*/
	.global _start
//        .thumb
_start: 
#if 1
	ldr r7,=4     /* the sys call */
	ldr r0,=0     /* 0 fildes stdout */
	ldr r1,=1f    /* the msg */
	ldr r2,=16    /* nbyte */
	swi 0         /* make call */
#endif
0:	b 0b
	
1:	.ascii "-- S Hello World\n"	
              /*01234567890123456 */ 
