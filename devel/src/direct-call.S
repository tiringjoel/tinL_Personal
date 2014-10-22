/*---------------------
 direct-call
 (c) H.Buchmann FHNW 2009
 $Id$
 ---------------------
 a very simple unix init process
 calls system call write
 write(stdout,Msg,sizeof(msg))
 without any library support
 */
 
.global _start


#define EABI

.text
_start:
	mov r0,#0	              /* file Id 0 stdout  */
	ldr r1,=Msg	                 /* address of Msg */
	ldr r2,=MsgEnd        /* address of end of message */
	sub r2,r2,r1                 /* r2 size of message */
#ifdef EABI	
	mov r7,#4                        /* code for write */
	swi 0
#else	                                     /* legacy ABI */	
	swi 0x00900004               /* transfer to kernel */
	                                           /* EABI */
#endif
forever:
	b forever
	
Msg:	.ascii "Hello World\n"
MsgEnd:

/* TODO
 count chars in Msg automatically
*/
