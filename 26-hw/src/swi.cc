//-------------------
//swi.cc
//(c) H.Buchmann FHNW 2018
//-------------------
#include <iostream>
#include <fstream>
struct SWIInfo
{
 time_t          when;
 unsigned        nbr;
 unsigned        state;
};

int main(int argc,char** args)
{
 SWIInfo info;
 while(true)
 {
  std::ifstream swi("/sys/my-hw/swi"); //open
  swi.read((char*)&info,sizeof(info));
  std::cout<<"when:  "<<info.when<<"\n"
           <<"nbr:   "<<info.nbr<<"\n"
           <<"state: "<<info.state<<"\n";  
 }
 return 0;                           
}
