//-------------------------
//led-direct-1.cc
//(c) H.Buchmann FHNW 2019
//-------------------------
#include <iostream>
#include <iomanip>
#include <chrono>
#include <thread>

#include "mem.h" 

template<typename T,unsigned FROM,unsigned TO>
struct GAP
{
 T gap[(TO-FROM)/sizeof(T)];
};

template<unsigned FROM,unsigned TO>
using GAPW = GAP<unsigned,FROM,TO>;

struct GPIO 
{
 unsigned REVISION;                // 000h Section 25.4.1.1
 GAPW<0x004,0x010> gap0;
 unsigned SYSCONFIG;               // 010h Section 25.4.1.2
 GAPW<0x014,0x020> gap1;
 unsigned EOI;                     // 020h Section 25.4.1.3
 unsigned IRQSTATUS_RAW_0;         // 024h Section 25.4.1.4
 unsigned IRQSTATUS_RAW_1;         // 028h Section 25.4.1.5
 unsigned IRQSTATUS_0;             // 02Ch Section 25.4.1.6
 unsigned IRQSTATUS_1;             // 030h Section 25.4.1.7
 unsigned IRQSTATUS_SET_0;         // 034h Section 25.4.1.8
 unsigned IRQSTATUS_SET_1;         // 038h Section 25.4.1.9
 unsigned IRQSTATUS_CLR_0;         // 03Ch Section 25.4.1.10
 unsigned IRQSTATUS_CLR_1;         // 040h Section 25.4.1.11
 unsigned IRQWAKEN_0;              // 044h Section 25.4.1.12
 unsigned IRQWAKEN_1;              // 048h Section 25.4.1.13
 GAPW<0x04c,0x114> gap2;
 unsigned SYSSTATUS;               // 114h Section 25.4.1.14
 GAPW<0x118,0x130> gap3;
 unsigned CTRL;                    // 130h Section 25.4.1.15
 unsigned OE;                      // 134h Section 25.4.1.16
 unsigned DATAIN;                  // 138h Section 25.4.1.17
 unsigned DATAOUT;                 // 13Ch Section 25.4.1.18
 unsigned LEVELDETECT0;            // 140h Section 25.4.1.19
 unsigned LEVELDETECT1;            // 144h Section 25.4.1.20
 unsigned RISINGDETECT;            // 148h Section 25.4.1.21
 unsigned FALLINGDETECT;           // 14Ch Section 25.4.1.22
 unsigned DEBOUNCENABLE;           // 150h Section 25.4.1.23
 unsigned DEBOUNCINGTIME;          // 154h Section 25.4.1.24
 GAPW<0x158,0x190> gap4;
 unsigned CLEARDATAOUT;            // 190h Section 25.4.1.25
 unsigned SETDATAOUT;              // 194h Section 25.4.1.26
};



static const unsigned GPIO1=0x4804'C000;
static const unsigned PIN=21; //USR0
static const auto dur=std::chrono::milliseconds(500);

int main(int argc,char** args)
{
//reading GPIO-Revision
 Mem<GPIO> gpio1(GPIO1);
 std::cout<<"Revision="<<std::hex<<gpio1().REVISION<<"\n";

 gpio1().OE&=~(1<<PIN); //as output
 while(true)
 {
  gpio1().CLEARDATAOUT=(1<<PIN); //clear
  std::this_thread::sleep_for(dur);
  gpio1().SETDATAOUT=(1<<PIN); //set
  std::this_thread::sleep_for(dur);
 } 
 return 0;
}
