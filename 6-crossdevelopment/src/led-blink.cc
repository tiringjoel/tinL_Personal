//---------------------------
//led-blink.cc
//(c) H.Buchmann FHNW 2019
//---------------------------
#include <string>
#include <fstream>
#include <iostream>
#include <chrono>
#include <thread>

static const auto PIN="53";
static const std::string VALUE="/sys/class/gpio/gpio53/value";


int main(int argc,char** args)
{
 const auto dur=std::chrono::milliseconds(500);
 //open file value
 
 while(true)
 {
  //set value to 1 an flush
  value<<"1\n";
  std::this_thread::sleep_for(dur);
  //set value to 0 an flush
  std::this_thread::sleep_for(dur);
 }
 return 0;
}
