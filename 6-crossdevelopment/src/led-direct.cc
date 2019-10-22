//-------------------------
//led-direct.cc
//(c) H.Buchmann FHNW 2019
//-------------------------
#include <iostream>
#include <iomanip>
#include <chrono>
#include <thread>

#include "mem.h" 

static const unsigned GPIO1=0x4804'C000;
static const unsigned PIN=21; //USR0
static const auto dur=std::chrono::milliseconds(500);

int main(int argc,char** args)
{
//reading GPIO-Revision
 Mem<unsigned> gpio1(GPIO1);
 std::cout<<"Revision="<<std::hex<<gpio1()[0]<<"\n";

 gpio1()[0x134/4]&=~(1<<PIN); //as output
 while(true)
 {
  gpio1()[0x190/4]=(1<<PIN); //clear
  std::this_thread::sleep_for(dur);
  gpio1()[0x194/4]=(1<<PIN); //set
  std::this_thread::sleep_for(dur);
 } 
 
 return 0;
}
