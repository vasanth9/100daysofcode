/*https://www.techiedelight.com/sort-binary-array-linear-time/*/
//count number of zeros or ones
//fill zeros and then ones
//using quick sort
#include<iostream>

void partition(int A[],int n)
{
int pivot =1;
int j=0;
for(int i=0;i<n;i++)
{
  if(A[i]<pivot)
  {
    std::swap(A[i],A[j]);
    j++;
  }
}

}
int main()
{
  int A[] = { 1, 0, 0, 0, 1, 0, 1, 1 };
  int n = sizeof(A)/sizeof(A[0]);
  partition(A,n);
  for(int i=0;i<n;i++)
  {
    std::cout<<A[i]<<" ";
  }
  std::cout<<"\n";
  return 0;
}