/*https://www.techiedelight.com/find-equilibrium-index-array/*/
#include<iostream>
#include<numeric>
void equilibriumIndex(int A[],int n)
{
  int total=std::accumulate(A,A+n,0);
  int right=0;
  for(int i=0;i<n;i++)
  {
    if(right==(total-(A[i]+right)))
    {
      std::cout<<"equilibrium at index: "<<i<<"\n";
    }
    right+=A[i];
  }
}


int main()
{
  int A[] = { 0, -3, 5, -4, -2, 3, 1, 0 };
  int n = sizeof(A) / sizeof(A[0]);
 
  equilibriumIndex(A, n);
 
  return 0;
}