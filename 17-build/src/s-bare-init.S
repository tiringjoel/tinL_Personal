/*------------------------
  s-bare-init
  (c) H.Buchmann FHNW 2015
  see man page syscall
   Architecture calling convention for arm/EABI

  using syscall for
    ssize_t write(int fildes, const void *buf, size_t nbyte)
            |     |           |                |
	    |     |           |                r2
	    |     |           r1
	    |     r0            
           r7 see syscall.h
		  
  kernel parameter   
    console=ttyAMA0,115200 root=/dev/mmcblk0p3 rootfstype=ext4 rootwait init=/s-bare-init
  ------------------------*/
	.global _start

_start: 
	ldr r7,=4     /* the sys call */
	ldr r0,=0     /* 0 fildes stdout */
	ldr r1,=1f    /* the msg */
	ldr r2,=16    /* nbyte */
	swi 0         /* make call */
0:	b 0b
	
1:	.ascii "-- S Hello World\n"	
              /*01234567890123456 */ 
