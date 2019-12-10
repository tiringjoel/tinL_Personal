/*-----------------------
 uevent-userspace.c
 (c) H.Buchmann FHNW 2018
 https://stackoverflow.com/questions/44662644/how-to-work-with-netlink-kobject-uevent-protocol-in-user-space
 ------------------------*/
#include <linux/netlink.h>
#include <sys/socket.h>
#include <string.h>
#include <unistd.h>
#include <stdio.h>

#define BUF_SIZE 4096

static char buf[BUF_SIZE];
static struct sockaddr_nl nls;

int main(int argc,char** args)
{
/*---------------------------------  initialize */
 int fd = socket(PF_NETLINK, SOCK_RAW, NETLINK_KOBJECT_UEVENT);
 perror("socket");
 
 memset(&nls, 0, sizeof(nls));
 nls.nl_family = AF_NETLINK;
 nls.nl_pid = getpid();
 nls.nl_groups = 1;

 int res = bind(fd, (struct sockaddr *)&nls, sizeof(nls));
 perror("bind");

/*---------------------------------  listen */ 
 while(1)
 {
  int len=recv(fd, buf, sizeof(buf), 0); //listen the read of sockets
  if (len>0)
     {
      write(STDOUT_FILENO,buf,len);
     }
     else
     {
      printf("len %d\n",len);
     }
 }
 return 0;
}
