/*https://www.techiedelight.com/find-maximum-product-two-integers-array/*/
#include<iostream>
#include<algorithm>

void findMaximumProduct(int arr[],int n)
{
  std::sort(arr,arr+n);
  int max1=arr[0]*arr[1];//if negative values present
  int max2=arr[n-1]*arr[n-2];
  max1>max2?std::cout<<max1<<"\n":std::cout<<max2<<"\n";

}

int main()
{
  int arr[] = { -10, -3, 5, 6, -20 };
  int n = sizeof(arr) / sizeof(arr[0]);
 
  findMaximumProduct(arr, n);
 
  return 0;
}