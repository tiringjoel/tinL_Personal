//----------------------------
//led.cc access from user space via c++
//(c) H.Buchmann FHNW 2018
//----------------------------
#include <iostream>
#include <fstream>
#include <thread>
#include <chrono>


void blink()
{
 unsigned state=0;
 std::chrono::milliseconds delta(500);
 std::ofstream led("/sys/my-hw/led");
 while(true)
 {
  state^=1;
  char l=(state)?'1':'0';
  std::cout<<l<<"\n";
  {
   led<<l<<std::flush;
  }
  std::this_thread::sleep_for(delta);
 }
}

int main(int argc,char** args)
{
 std::thread blnk(blink);
 blnk.join(); //<------------ wait untile thread blnk terminates
 return 0;
}
