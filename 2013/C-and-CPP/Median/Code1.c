#include<stdio.h>

int main()
{
  int i, j, n;
  float temp, median;
  
  printf("Enter the Sample Size: ");
  scanf("%d", &n);
  
  float x[n];
  printf("Enter the Data: ");
  for(i = 1; i <= n; ++i){
    scanf("%f", &x[i]);
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
    printf("Sorted Data: ");
  for(i = 1; i <= n; ++i){
    printf("%2.2f ", x[i]);
  }
  printf("\n");
  
  /*Compute the Median*/
    if(n % 2 == 0){
      median = (x[n / 2] + x[n / 2 + 1]) / 2;
    }
  else{
    median = x[n / 2 + 1];
  }
  
  printf("Median: %2.2f\n", median);
  
  return 0;
}
