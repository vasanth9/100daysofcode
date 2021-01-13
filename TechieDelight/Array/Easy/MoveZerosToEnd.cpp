/*https://www.techiedelight.com/move-zeros-present-array-end/*/
#include<iostream>
#include<vector>
void toEnd(std::vector<int>v)
{
  int n=v.size();
  int pivot=0;
  int j=0;
  for(int i=0;i<n;i++)
  {
    if(v[i]!=0)
    {
      std::swap(v[i],v[j]);
      j++;
    }
  }
  for(int elem:v){
    std::cout<<elem<<" ";
  }
  std::cout<<"\n";
}

int main()
{
  std::vector<int>v={ 6, 0, 8, 2, 3, 0, 4, 0, 1 };
  toEnd(v);
  
}