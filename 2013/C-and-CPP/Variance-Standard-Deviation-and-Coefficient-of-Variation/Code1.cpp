#include <iostream>
#include <iomanip>
#include <math.h>

using namespace std;

int main()
{
  int i, n;
  float mean, sd, var, dev, sum = 0.0,
  sdev = 0.0, cv;
  
  cout << "Enter the Sample Size: ";
  cin >> n;
  
  float x[n];
  cout << "Enter the Data: ";
  for (i = 1; i <= n; ++i){
    cin >> x[i];
    sum = sum + x[i];
  }
  
  mean = sum / n;
  
  for(i = 1; i <= n; ++i){
    dev = (x[i] - mean)*(x[i] - mean);
    sdev = sdev + dev;
  }
  
  var = sdev / (n - 1);
  sd = sqrt(var);
  cv = (sd / mean) * 100;
  
  cout << "Variance: ";
  cout << setprecision(5) << var << endl;
  cout << "Standard Deviation: ";
  cout << setprecision(5) << sd << endl;
  cout << "Coefficient of Variation: ";
  cout << setprecision(5) << cv << "\%" << endl;
  
  return 0;
}
