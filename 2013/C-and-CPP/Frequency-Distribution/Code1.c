#include <stdio.h>
#include <math.h>

int main()
{
  int i, j, n, nci, freq = 0;
  float temp, min, max, range, interval, cibase;
  
  printf("Enter the Sample Size: ");
  scanf("%d", &n);
  
  float x[n];
  printf("Enter the Data: ");
  for(i = 0; i < n; ++i){
    scanf("%f", &x[i]);
  }
  
  printf("\n");
  printf("Number of Class Interval (7 - 20): ");
  scanf("%d", &nci);
  
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
    
    printf("\n");
    
    min = x[0];
    max = x[n - 1];
    range = max - min;
    interval = ceil(range / nci);
    
    printf(" Class Interval \t");
    printf(" Freq \t");
    printf(" Class Boundary \t");
    printf(" Class Mark \n");
    
    cibase = min;
    while(cibase <= max){
      printf("%5.0f - %4.0f\t\t", cibase, (cibase - 1) + interval);
      freq = 0;
      for(i = 0; i < n; ++i){
        if(x[i] >= cibase && x[i] <= ((cibase - 1) + interval)){
          ++freq;
        }
      }
      printf("%4d\t", freq);
      printf("%6.1f - %6.1f\t\t", cibase - 0.5, (cibase - 0.5) + interval);
      printf("%9.1f\t", (cibase + ((cibase - 1) + interval)) / 2);
      printf("\n\n");
      cibase = cibase + interval;
    }
    
    printf("Minimum: %6.1f\n", min);
    printf("Maximum: %6.1f\n", max);
    printf("Range: %6.1f\n", range);
    printf("Interval: %6.1f\n", interval);
  }
  else{
    printf("ERROR: Choose Between 7 and 20\n");
    printf("Try Again!\n");
  }
  
  return 0;
}
