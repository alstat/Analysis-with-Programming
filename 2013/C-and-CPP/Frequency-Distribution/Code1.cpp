#include <iostream>
#include <iomanip>
#include <math.h>

using namespace std;

int main()
{
  int i, j, n, nci, freq = 0;
  float temp, min, max, range, interval, cibase;
  
  cout << "Enter the Sample Size: ";
  cin >> n;
  
  float x[n];
  cout << "Enter the Data: ";
  for(i = 0; i < n; ++i){
    cin >> x[i];
  }
  
  cout << endl;
  cout << "Number of Class Interval (7 - 20): ";
  cin >> nci;
  
  if(nci >= 7 && nci <= 20){
    for(i = 0; i < n; ++i){
      for(j = 1 + i; j < n; ++j){
        if(x[i] > x[j]){
          temp = x[i];
          x[i] = x[j];
          x[j] = temp;
        }
      }
    }
    
    cout << endl;
    
    min = x[0];
    max = x[n - 1];
    range = max - min;
    interval = ceil(range / nci);
    
    cout << " Class Interval \t";
    cout << " Freq \t";
    cout << " Class Boundary \t";
    cout << " Class Mark " << endl;
    
    cibase = min;
    while(cibase <= max){
      cout.width(5); cout << right << cibase << " - ";
      cout.width(4); cout << right << (cibase - 1) + interval << "\t\t";
      freq = 0;
      for(i = 0; i < n; ++i){
        if(x[i] >= cibase && x[i] <= ((cibase - 1) + interval)){
          ++freq;
        }
      }
      cout.width(4); cout << right << freq << "\t";
      cout.width(6); cout << right << cibase - 0.5 << " - ";
      cout.width(5); cout << right << (cibase - 0.5) + interval << "\t\t";
      cout.width(9); cout << right << (cibase + ((cibase - 1) + interval)) / 2 << "\t";
      cout << "\n" << endl;
      cibase = cibase + interval;
    }
    
    cout.width(6); cout << "Minimum: " << setprecision(5) << right << min << endl;
    cout.width(6); cout << "Maximum: " << setprecision(5) << right << max << endl;
    cout.width(6); cout << "Range: " << setprecision(5) << right << range << endl;
    cout.width(6); cout << "Interval: " << setprecision(5) << right << interval << endl;
  }
  else{
    cout << "ERROR: Choose Between 7 and 20" << endl;
    cout << "Try Again!" << endl;
  }
  
  return 0;
}
