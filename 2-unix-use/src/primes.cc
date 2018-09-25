//-------------------------
//primes as benchmark
//(c) H.Buchmann FHNW 2018
//-------------------------
#include <iostream>
#include <vector>

class Primes
{
 public:
  Primes(unsigned n); //primes<=n

 private:
  std::vector<unsigned> primes;
  bool isPrime(unsigned v); 
};

Primes::Primes(unsigned n)
{
 std::cout<<"start\n";
 primes.push_back(2);
 for(unsigned z=2;z<=n;++z)
 {
  if (isPrime(z)) 
     {
      primes.push_back(z);
     }
 }
#if 0
 for(auto p:primes)
 {
  std::cout<<p<<"\n";
 }
#endif
 std::cout<<"done\n";
}

bool Primes::isPrime(unsigned z)
{
 unsigned i=0;
 while(true)
 {
  unsigned p=primes[i];
// z=q*p + r  
  unsigned r=z%p;
  if (r==0) return false;
  unsigned q=z/p;
  if (q<=p) return true;
  ++i;
 }
}

int main(int argc,char** args)
{
 Primes primes(1000000);
}
