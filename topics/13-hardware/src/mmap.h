#pragma once
#include <iostream>
#include <iomanip>
//----------------------
//mmap
//(c) H.Buchmann FHNW 2014
//----------------------
class Mem 
{
 public:
   Mem(unsigned start,  
       unsigned lenBytes); 
  ~Mem();
  unsigned char*const mem()const {return base+OFS;}
  
 private:
   const unsigned PAGE_SIZE;
   const unsigned OFS; //BASE+OFS=start 
   const unsigned BASE;//BASE PAGE_SIZE aligned 
   const unsigned LEN; //OFS+LEN
   unsigned char*const base;
};
