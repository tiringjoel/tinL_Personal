/*---------------------
 syscall-c
 (c) H.Buchmann FHNW 2018
 ----------------------*/
#include <unistd.h>
#include <sys/syscall.h>

int main(int argc,char** args)
{
 /* write(f,void* buffer,unsigned len) */
 char s[]="Hello World\n";
         /*01234567890 */
 syscall(SYS_write,0,s,12);
 return 0;
} 
