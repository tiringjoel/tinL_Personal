#pragma once
//--------------------------
//mem.h using templates
//(c) H.Buchmann FHNW 2015
//--------------------------

class Bytes
{
 template<typename T> friend class Mem;
  Bytes(unsigned at,unsigned size);
 ~Bytes();
 const unsigned offset;
 const unsigned len;
 int            id=-1;
 unsigned char*const page;
 volatile unsigned char*const mem;
};

template<typename T>
class Mem
{
 public:
   Mem(unsigned at)
   :mem(at,sizeof(T)){}
   Mem(unsigned at,unsigned n)  //for an array of T
   :mem(at,n*sizeof(T)){}
  ~Mem(){}
   
//   T*const operator()()const{return (T*const)(mem.mem);}
   T& operator()()const{return *(T*const)(mem.mem);}
 private:
  Bytes mem;
};


