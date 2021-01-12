/*https://www.techiedelight.com/find-pair-with-given-sum-array/*/
//using Hashing O(n)
#include<iostream>
#include<unordered_map>
void findPair(int arr[],int n, int sum)
{
  std::unordered_map<int,int>map;
  for(int i=0;i<n;i++)
  {
    if(map.find(sum-arr[i])!=map.end())
    {
      std::cout<<"Pair found: "<<sum-arr[i]<<" "<<arr[i]<<"\n";
      return;
    }
    map[arr[i]]=i;
  }
  std::cout<<"Pair not found\n";
}
int main()
{
  int arr[] = { 8, 7, 2, 5, 3, 1};
  int sum = 10;
 
  int n = sizeof(arr)/sizeof(arr[0]);
 
  findPair(arr, n, sum);
 
  return 0;
}

