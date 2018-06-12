//-------------------
//swi.cc
//(c) H.Buchmann FHNW 2018
//-------------------
#include <iostream>
#include <fstream>
struct SWIInfo
{
 unsigned        when;
 unsigned        nbr;
 unsigned        state;
 friend std::ostream& operator<<(std::ostream& out,const SWIInfo& info);
};

std::ostream& operator<<(std::ostream& out,const SWIInfo& info)
{
 out<<"when: "<<info.when<<" nbr: "<<info.nbr<<" state: "<<info.state;
 return out;
}


int main(int argc,char** args)
{
 SWIInfo info;
 while(true)
 {
  std::ifstream swi("/sys/my-hw/swi"); //open
  swi.read((char*)&info,sizeof(info));
  std::cout<<info<<"\n";  
 }
 return 0;                           
}
