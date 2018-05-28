//-------------------
//swi.cc
//(c) H.Buchmann FHNW 2018
//-------------------
#include <iostream>
#include <fstream>
int main(int argc,char** args)
{
 while(true)
 {
  char ch;
  {
   std::ifstream swi("/sys/my-hw/swi"); //open 
   swi>>ch;
  }                  //destructor called close 
  std::cout<<ch<<"\n";
 }
 return 0;                           
}
