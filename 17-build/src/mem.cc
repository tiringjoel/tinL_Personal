//--------------------------
//mem.h using templates
//(c) H.Buchmann FHNW 2015
//--------------------------
#include "mem.h"
#include <cstdio>
#include <unistd.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/mman.h>

#define MEM_TEST
/*
 ----------------------------------------------
           |            |                     |
        page           at                     |
		   |----------->|-------------------->|
		    offset             size
*/
Bytes::Bytes(unsigned at,unsigned size)
:offset(at%sysconf(_SC_PAGESIZE))
,len(offset+size)
,id(::open("/dev/mem",O_RDWR|O_SYNC))
,page((unsigned char*)mmap(0,len,PROT_READ|PROT_WRITE,MAP_SHARED,id,at-offset))
,mem(page+offset)
{
 
}

Bytes::~Bytes()
{
 munmap(mem,len);
}

#ifdef MEM_TEST
int main(int argc,char** args)
{
 Mem<unsigned> m(0x44E10000,128*(1<<10)/4);
 unsigned v=m()[0x950/4];
 std::printf("v=%x\n",v);
 return 0;
}
#endif
