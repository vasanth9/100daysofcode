/*https://www.techiedelight.com/maximum-subarray-problem-kadanes-algorithm/*/
#include<iostream>
int kadaneNeg(int arr[],int n)
{
  int max_end=arr[0];
  int max_far=arr[0];
  for(int i=1;i<n;i++)
  {
    max_end+=arr[i];
    max_end=std::max(max_end,arr[i]);
    max_far=std::max(max_end,max_far);
  }
  return max_far;
}

int main()
{
  int arr[] = { -8, -3, 6, -2, 5, -4 };
  int n = sizeof(arr)/sizeof(arr[0]);
 
  std::cout << "The sum of contiguous subarray with the largest sum is " <<kadaneNeg(arr, n);
 
  return 0;
}