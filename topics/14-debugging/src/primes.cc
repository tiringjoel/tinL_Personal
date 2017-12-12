//-------------------------------
//prime numbers
//(c) H.Buchmann FHSO 2015
//-------------------------------
#include <iostream>
#include <iomanip>
#include <ctime>
#include <vector>
class Primes
{
//your work    
 public: 
  Primes(unsigned n);
  ~Primes();
  void show();

 private:
  std::vector<unsigned> primes; //template
  void addPrime(unsigned p);
  unsigned sizePrime();
  bool isPrime(unsigned z);
};

void Primes::addPrime(unsigned p)
{
 primes.push_back(p);
}

unsigned Primes::sizePrime()
{
 return primes.size();
}

bool Primes::isPrime(unsigned z)
{
 for(unsigned i=0;;++i)
 {
  unsigned pi=primes[i];
  //z=pi*q + r
  unsigned q=z/pi;
  unsigned r=z%pi;
  if (r==0) return false;
  if (q<=pi) return true;
 }
}

void Primes::show()
{
 unsigned line=0;
 for(unsigned i=0;i<primes.size();++i)
 {
  if (line==10)
     {
      std::cout<<"\n";
      line=0;
     }
  std::cout<<std::setw(10)<<primes[i];
  ++line;
 }
 std::cout<<"\n";
}

Primes::Primes(unsigned n)
{
 addPrime(2);
 for(unsigned z=3;z<n;++z)
 {
  if (isPrime(z)) addPrime(z);
 }
}

Primes::~Primes()
{
}

int main(int argc,char* args[])
{
 Primes primes(100);
 primes.show();
}
