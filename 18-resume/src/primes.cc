//------------------------
//primes.cc used as benchmark
//(c) H.Buchmann FHNW 2018
//------------------------
#include <iostream>
#include <vector>

class Primes
{
 public:
  Primes(unsigned max);
 private:
  std::vector<unsigned> primes;
  bool isPrime(unsigned z);
};

bool Primes::isPrime(unsigned z)
{
 unsigned i=0;
 while(true)
 {
  auto pi=primes[i++];
  //z=p*pi+r
  auto p=z/pi;
  auto r=z%pi;
  if (r==0) return false;
  if (p<pi) return true;
 }
}

Primes::Primes(unsigned max)
:primes({2})
{
 unsigned z=3;
 while(z<max)
 {
  if (isPrime(z)) 
  {
   primes.push_back(z); 
  }
  z+=2;
 }
 std::cout<<primes.size()<<" primes<"<<max<<"\n";
}

int main(int argc,char** args)
{
 Primes p(2'000'000);
 return 0;
}
