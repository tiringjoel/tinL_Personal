//----------------------
//pmem
//(c) H.Buchmann FHNW 2014
//TODO exception handling
//----------------------
#include "mmap.h"
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>

//#define MMAP_TEST

Mem::Mem(unsigned start,unsigned lenBytes)
:PAGE_SIZE(::sysconf(_SC_PAGESIZE))
,OFS(start%PAGE_SIZE)
,BASE(start-OFS)
,LEN(lenBytes+OFS)
,base((unsigned char*)
       ::mmap(0,LEN,
                PROT_READ|PROT_WRITE,
		MAP_SHARED,
		::open("/dev/mem",O_RDWR|O_SYNC),
		BASE)
     ) 
{
 std::cerr<<std::hex
          <<"PAGE_SIZE="<<PAGE_SIZE<<"\n"
	  <<"    start="<<start<<"\n"
          <<"     OFS ="<<OFS<<"\n"
	  <<"     BASE="<<BASE<<"\n";
 std::cerr<<(void*)base<<"\n";
 *((unsigned*)(base+OFS))=0x3;
}

Mem::~Mem()
{
 int err=::munmap(base,LEN);
 if (err<0)
    {
     perror("munmap");
    }
}

#ifdef MMAP_TEST
//0xFF210040 seg7
int main(int argc,char** args)
{
 Mem mem(0xFF210040,0x1000);
 unsigned*const d=(unsigned*const)mem.mem();
 d[0]=1;
}

#endif 
