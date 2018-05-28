//-------------------
//swi.cc
//(c) H.Buchmann FHNW 2018
//-------------------
#include <iostream>
#include <fstream>
int main(int argc,char** args)
{
 std::ifstream swi("/sys/my-hw/swi"); //open 
 while(true)
 {
  char ch;
  swi>>ch;
  std::cout<<ch<<"\n";
 }
 return 0;                           
}
