#include<stdio.h>

int main()
{
  int i, x;
  float y, sum = 0.0;
  
  printf("Enter the Sample Size: ");
  scanf("%d", &x);
  
  printf("Enter the Data: ");
  for(i = 1; i <= x; ++i){
    scanf("%f", &y);
    sum += y;
  }
  
  float mean = sum/x;
  printf("Mean: %2.2f\n", mean);
  return 0;
}
