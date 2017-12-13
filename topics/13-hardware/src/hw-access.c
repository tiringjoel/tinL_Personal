/*-------------------------------
  hw-access
  (c) H.Buchmann FHNW 2013
  mem read  addr [len]
      write addr data+ 
  the solution    
---------------------------------*/
#include <stdio.h>
#include <fcntl.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <unistd.h>
#include <string.h>

static const char*    name;
static long  unsigned pageSize;
static unsigned char* mem;
static long unsigned  memLen;
 
static void usage()
{
 fprintf(stderr,"usage: %s: rd addr [len]\n"
                "  len in 32bit words \n"
		"      %s: wr addr data+\n"
		"  data 32 bit\n",
                name,name);
 exit(1);
}

static long unsigned number(const char*const s)
{
 char* end;
 long unsigned v=strtoul(s,&end,0);
 if (*end!='\0')
    {
     fprintf(stderr,"'%s' not a number\n",s);
     usage();
    }
 return v;
}


volatile unsigned* memOpen(long unsigned start,long unsigned len)
{
 int memId=open("/dev/mem",O_RDWR|O_SYNC);
 if (memId<0)
    {
     perror("open '/dev/mem'");
     return 0;
    }
 long unsigned step  =start%pageSize; /* TODO optimize in case of power of 2 */
 long unsigned offset=start-step;
 memLen=sizeof(unsigned)*len+step;
 fprintf(stderr,"pageSize=%x start=%x len=%x\n"
                "offset=%x\n"
		"step  =%x\n"
		"memLen=%x\n",
         pageSize,start,len,offset,step,memLen);    
 mem=(unsigned char*)mmap(0, /* addr hint */
			  memLen,
			  PROT_READ|PROT_WRITE,
			  MAP_SHARED, 
			  memId,
			  offset);
 unsigned* m=(unsigned*)(mem+step);
 fprintf(stderr,"mem=%p\tm=%p\n",mem,m);
 return m;
}

void memClose()
{
 if (msync(mem,memLen,MS_INVALIDATE)<0)
    {
     perror("msync");
    }
 if (munmap(mem,memLen)<0)
    {
     perror("munmap");
    }
}


static void disp(long unsigned start,long unsigned len)
{
 long unsigned step  =start%pageSize; /* TODO optimize in case of power of 2 */
 long unsigned offset=start-step;
 
 volatile unsigned* m=memOpen(start,len);
 for(unsigned i=0;i<len;++i)
 {
  unsigned v=m[i];
  fwrite(&v,sizeof(v),1,stdout);    
 }
 memClose();
}

void set(long unsigned start,char** args,int argc)
{
 unsigned val[argc];
 for(unsigned i=0;i<argc;++i)
 {
  val[i]=number(args[i]);
 }
 volatile unsigned* m=memOpen(start,argc);
 for(unsigned i=0;i<argc;++i)
 {
  printf("%x\n",val[i]);
  m[i]=val[i];
 }
 memClose();
}

int main(int argc,char** args)
{
 name=args[0];
 pageSize=sysconf(_SC_PAGESIZE);
 long unsigned len  =1;
 if (argc<3) usage();
 if (strcmp(args[1],"rd")==0)
    {
     switch(argc)
     {
      case 4: /* mem rd addr len */
       len=number(args[3]);
      case 3: /* mem rd addr */
      {
       long unsigned start=number(args[2]);
       disp(start,len);
      }
      return 0;
     }
     usage();
    }
 if (strcmp(args[1],"wr")==0)
    { /* mem wr addr data+ */
     if (argc<4) usage();
     long unsigned start=number(args[2]);
     set(start,args+3,argc-3);
    }
}    
