//-------------------------
//led-direct-0.cc
//(c) H.Buchmann FHNW 2019
// [1] doc/beaglebone-black/spruh73l.pdf section 25
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
 Mem<unsigned[0x200]> gpio1(GPIO1); //unsigned array of length 0x200
 std::cout<<"Revision="<<gpio1()[0]<<"\n";

//set PIN as output: register OE
 while(true)
 {
//clear PIN register GPIO_CLEARDATAOUT
  std::this_thread::sleep_for(dur);
//set PIN register GPIO_SETDATAOUT
  std::this_thread::sleep_for(dur);
 } 
 
 return 0;
}
