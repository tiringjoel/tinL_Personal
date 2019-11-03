//---------------------------
//cgi-led.cc
//(c) H.Buchmann FHNW 2019
//---------------------------
#include <iostream>
#include "cgi.h"
#include "gpio.h"

static const unsigned PIN=17; //21; //USR0
CGI cgi;

int main(int argc,char** args)
{
 std::cout<<"Content-type: text/plain\n\n";
 
 auto led=cgi.query["led"];
 std::cout<<"LED="<<cgi.query["led"]<<"\n";
 GPIO::gpio1().OE&=~(1<<PIN);
 if (led=="on")
   {
    std::cout<<"on\n";
    GPIO::gpio1().SETDATAOUT=1<<PIN;
   } 
   else
   {
    std::cout<<"off\n";
    GPIO::gpio1().CLEARDATAOUT=1<<PIN;
   }
 return 0;
}
