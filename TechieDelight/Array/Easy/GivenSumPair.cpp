/*https://www.techiedelight.com/find-pair-with-given-sum-array/*/
#include<iostream>
#include<algorithm>
//using sorting O(nlogn);
void findPair(int arr[],int n,int sum)
{
  std::sort(arr,arr+n);
  int low=0;
  int high=n-1;
  while(low<high)
  {
    if(arr[low]+arr[high]==sum)
    {
      std::cout<<"Pair found "<<arr[low]<<" "<<arr[high]<<"\n";
      return;

    }
    else
    {
      (arr[low]+arr[high])<sum?low++:high--;
    }
  }
  std::cout<<"Pair not found\n";
}








int main()
{
int arr[]={8, 7, 2, 5, 3, 1};
int sum=10;
int size=sizeof(arr)/sizeof(arr[0]);
findPair(arr,size,sum);
return 0;
}