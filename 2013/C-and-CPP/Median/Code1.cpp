#include<iostream>
#include<iomanip>

using namespace std;

int main()
{
  int i, j, n;
  float temp, median;
  
  cout << "Enter the Sample Size: ";
  cin >> n;
  
  float x[n];
  cout << "Enter the Data: ";
  for(i = 1; i <= n; ++i){
    cin >> x[i];
  }
  
  /*Sort the Data*/
    for(i = 1; i <= n; ++i){
      for(j = i + 1; j <= n; ++j){
        if(x[i] > x[j]){
          temp = x[i];
          x[i] = x[j];
          x[j] = temp;
        }
      }
    }
  
  /*Sorted Data*/
    cout << "Sorted Data: ";
  for(i = 1; i <= n; ++i){
    cout << x[i] << " ";
  }
  
  /*Compute the Median*/
    if(n % 2 == 0){
      median = (x[n / 2] + x[n / 2 + 1]) / 2;
    }
  else{
    median = x[n / 2 + 1];
  }
  
  cout << endl;
  cout << "Median: " << setprecision(4) << median << endl;
  
  return 0;
}
