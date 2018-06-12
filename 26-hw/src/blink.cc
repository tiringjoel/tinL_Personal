//----------------------------
//led.cc access from user space via c++
//(c) H.Buchmann FHNW 2018
//----------------------------
#include <iostream>
#include <fstream>
#include <thread>
#include <chrono>


void blink() //the threads code
{
 //create delta time interval using std::chrono
 while(true)
 {
  //toggle led
  //sleep delta
 }
}

int main(int argc,char** args)
{
 std::thread blnk(blink);
 //<------------ wait until thread blnk terminates
 return 0;
}
