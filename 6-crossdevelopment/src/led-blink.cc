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
void set(unsigned val)
{
 std::ofstream value(VALUE);
 value<<val<<"\n";
}

int main(int argc,char** args)
{
 const auto dur=std::chrono::milliseconds(500);
 while(true)
 {
  set(1);
  std::this_thread::sleep_for(dur);
  set(0);
  std::this_thread::sleep_for(dur);
 }
 return 0;
}
