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
#include <iostream>
#include <iomanip>

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
// std::printf("len=%x at=%x offset=%x\n",len,at,offset);
}

Bytes::~Bytes()
{
 munmap((void*)mem,len);
}

#ifdef MEM_TEST
int main(int argc,char** args)
{
 std::printf("------\n");
 Mem<unsigned> m(0x44E10800,128*(1<<10)/4);
 unsigned* v=m();
 v[84]=0x37;
 v[85]=0x37;
 for(unsigned p=84;p<84+5;++p)
 {
  std::cout<<std::hex<<"v[0x"<<p<<"]=0x"<<v[p]<<"\n";
//  std::printf("v[%d]=%x  \n",p,v[p]);
 }
 return 0;
}
#endif
