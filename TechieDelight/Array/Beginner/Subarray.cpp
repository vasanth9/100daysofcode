/*https://www.techiedelight.com/difference-between-subarray-subsequence-subset/*/
#include<iostream>
void printarray(int arr[],int start,int end)
{
  std::cout<<"{";
  for(int i=start;i<end;i++)
  {
    std::cout<<arr[i]<<",";
  }
  std::cout<<arr[end]<<"},";
}
void printallsubarrays(int arr[],int size)
{
 for(int i=0;i<size;i++)
 {
   for(int j=i;j<size;j++)
   {
     printarray(arr,i,j);
   }
 }

}


int main()
{
  int arr[]={1,2,3,4,5,6};
  int size=sizeof(arr)/sizeof(arr[0]);
  printallsubarrays(arr,size);
  return 0;
}