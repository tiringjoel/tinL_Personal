//-------------------
//swi.cc
//(c) H.Buchmann FHNW 2018
//-------------------
#include <iostream>
#include <fstream>
struct SWIInfo //see gpio-8.c
{
 unsigned        when;
 unsigned        nbr;
 unsigned        state;
};


int main(int argc,char** args)
{
 //instance of SWIInfo
 SWIInfo info;
 while(true)
 {
  //read info from /sys/my-hw/swi
  //show info
 }
 return 0;                           
}
