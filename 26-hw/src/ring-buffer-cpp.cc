//--------------------------
//ring-buffer-cpp.cc
//(c) H.Buchmann FHNW 2018
//--------------------------
#include <iostream>
#include <cstdlib>

template<typename T,unsigned CAP> //for arbitrary type
class RingBuffer
{
 public:
  RingBuffer(){}
  void put(T t)
  {
   data[putI++]=t;
   if (putI==CAP) putI=0;
   if (size<CAP)
      {
       ++size;
      }
      else
      {
       ++getI;
       if (getI==CAP) getI=0;
      }
  }
  
  T get()
  {
   if (size==0)
      {
       std::cout<<"---------------------- exception empty buffer ----------------\n";
       std::exit(1);
      }
   T d=data[getI++];
   if (getI==CAP) getI=0;
   --size;
   return d;
  }
  
  void show()
  {
   unsigned i=getI;
   unsigned size=this->size;
   while(size>0)
   {
    std::cout<<data[i++]<<"\n";
    if (i==CAP) {i=0;}
    --size;
   }
  }

 private:
  unsigned putI=0;
  unsigned getI=0;
  unsigned size=0; 
  T        data[CAP];
};

int main(int argc,char** args)
{
 RingBuffer<unsigned,8> rb;
 
 while(true)
 {
  std::cout<<"ringbuffer-test\n"
             " 0:exit\n"
             " 1:put\n"
             " 2:get\n"
             " 3:show\n"
             "your choice: "<<std::flush;
             
  char ch;
  std::cin>>ch;
  switch(ch)
  {
   case '0':
    return 0;
   break;
   
   case '1':
   {
    unsigned val;
    std::cin>>val;
    rb.put(val);
   }
   break;
   
   case '2':
    std::cout<<"get "<<rb.get()<<"\n";
   break;

   case '3':
    rb.show();
   break;
  }     
 }
 return 0;
}
