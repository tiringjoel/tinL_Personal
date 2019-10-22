//---------------------------
//led-enable.cc
//(c) H.Buchmann FHNW 2019
//---------------------------
#include <string>
#include <fstream>
#include <iostream>
static const std::string GPIO="/sys/class/gpio/";
static const auto PIN="53";
int main(int argc,char** args)
{
 {
  std::ofstream export_(GPIO+"export");
  export_<<PIN<<"\n";
  //close file 
 }
 {
  std::ofstream direction(GPIO+"gpio"+PIN+"/direction");
  std::cout<<GPIO+"gpio"+PIN+"/direction\n";
  direction<<"out\n";
 //close file
 }
 return 0;
}
