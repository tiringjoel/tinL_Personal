//-------------------------
//primes as benchmark
//(c) H.Buchmann FHNW 2018
//-------------------------
#include <iostream>
#include <vector>
#include <chrono>

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
  auto p=primes[i];
// z=q*p + r  
  auto r=z%p;
  if (r==0) return false;
  auto q=z/p;
  if (q<=p) return true;
  ++i;
 }
}

int main(int argc,char** args)
{
 auto t1 = std::chrono::high_resolution_clock::now();
 Primes primes(1'000'000); //a lot of primes
 auto t2 = std::chrono::high_resolution_clock::now();
 float duration = std::chrono::duration_cast<std::chrono::milliseconds>( t2 - t1 ).count();
 std::cout << duration/1000 << std::endl;
 return 0;
}
