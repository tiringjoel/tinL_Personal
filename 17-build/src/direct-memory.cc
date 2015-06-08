/*-------------------------------
  direct-memory
  (c) H.Buchmann FHNW 2015
  parameters
   'rd' base size|
   'wr' base data*
  test on host
  BIOS 0xf0000-0xfffff
----------------------------------*/   
#include <iostream>
#include <sstream>
#include <string>
#include <iomanip>
#include <cstdio>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>

class DirectMemory
{
 public:
   DirectMemory(int argc,char* args[]);
  ~DirectMemory();
 private:
  const unsigned pageSize;
  const int memId;
  const int argc;
  char**    args;
  unsigned char* pMem=0;
  unsigned* mem;
  unsigned  pLen=0;
  void read();
  void write();
  unsigned*const alloc(unsigned base,unsigned lenByte);
  void usage();
  static unsigned number(const char*const s);
  
};

DirectMemory::DirectMemory(int argc,char* args[])
:pageSize(sysconf(_SC_PAGESIZE))
,memId(::open("/dev/mem",O_RDWR|O_SYNC))
,argc(argc)
,args(args)
{
 if (memId<0)
    {
     std::perror("dev/mem");
     return;
    }
 if (argc<2) {usage();return;}
 std::string op(args[1]);
 if (op=="rd")
    {
     read();
     return;
    }
 if (op=="wr")
    {
     write();
     return;
    }
 usage();
}

DirectMemory::~DirectMemory()
{
 if (pMem)
    {
     ::msync(pMem,pLen,MS_INVALIDATE);
     ::munmap(pMem,pLen);
    }
 if (memId>0) ::close(memId);
}

unsigned DirectMemory::number(const char*const s)
{
//TODO check for errors
 std::istringstream in(s);
 unsigned v;
 in>>std::setbase(0)>>v;
 return v;
}

unsigned*const DirectMemory::alloc(unsigned base,unsigned lenByte)
{
 /*
                                len
                      base|<---------------------------->|
     ---------|-----------|------------------------------|--------
          page|---------->|                              |
	      |     offset                               |
	      |<---------------------------------------->|     
                               pLen
 */
 //your work
 unsigned offset=base%pageSize;
 unsigned page=base-offset;
 pLen= lenByte+offset;
// std::cerr<<std::hex<<base<<" len="<<lenByte<<"\n";
 pMem=(unsigned char*)::mmap(0,pLen,PROT_READ|PROT_WRITE,MAP_SHARED,memId,page);
 mem= (unsigned*)(pMem+offset);
 return mem;
}

void DirectMemory::read() //rd base size
{
 if (argc!=4){usage();return;}
 unsigned base=number(args[2]);
 unsigned size=number(args[3]);
 alloc(base,size*sizeof(unsigned));
 if (mem==0) return;
 std::cout.write((char*)mem,size*sizeof(unsigned));
}

void DirectMemory::write() //wr base data+
{
 if (argc<4){usage();return;}
 unsigned base=number(args[2]);
 unsigned* m=alloc(base,argc-3);
 for(unsigned i=3;i<argc;++i)
 {
  *m++=number(args[i]);
 }
}

void DirectMemory::usage()
{
 std::cerr<<"usage: "<<args[0]<<" rd base size |\n"
            "        wr base data+\n"
	    " data 32 bit\n"
	    " size in 32 bit data\n";
}


int main(int argc,char** args)
{
 DirectMemory dm(argc,args);
}   
