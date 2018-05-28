//----------------------------
//led.cc access from user space via c++
//(c) H.Buchmann FHNW 2018
//----------------------------
#include <fstream>
int main(int argc,char** args)
{
 std::ofstream led("/sys/my-hw/led"); //open 
 led<<'1';
 return 0;                           //destructor called close 
}
