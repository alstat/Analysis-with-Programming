#include<iostream> // Library for input/output
#include<iomanip> // Library for precision

using namespace std;

int main()
{
  int i, x;
  float y, sum = 0.0;
  
  cout << "Enter the Sample Size: ";
  cin >> x;
  
  cout << "Enter the Data: ";
  for(i = 1; i <= x; ++i){
    cin >> y;
    sum += y;
  }
  
  float mean = sum/x;
  cout << "Mean: " << setprecision(4) << mean << endl;
  return 0;
}
