#include <stdio.h>
#include <math.h>

int main()
{
  int i, n;
  float mean, sd, var, dev, sum = 0.0,
  sdev = 0.0, cv;
  
  printf("Enter the Sample Size: ");
  scanf("%d", &n);
  
  float x[n];
  
  printf("Enter the Data: ");
  for(i = 1; i <= n; ++i){
    scanf("%f", &x[i]);
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
  
  printf("Variance: %6.3f\n", var);
  printf("Standard Deviation: %6.3f\n", sd);
  printf("Coefficient of Variation: %6.3f\%\n", cv);
  
  return 0;
}
