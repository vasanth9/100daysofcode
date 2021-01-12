/*https://www.techiedelight.com/difference-between-subarray-subsequence-subset/*/
#include<iostream>

void printallSubstrings(std::string str)
{
 int len=str.length();
 for(int i=0;i<len;i++)
 {
   for(int j=i;j<len;j++)
   {
        std::cout<<str.substr(i,j-i+1)<<", ";
   }
 }
}
int main()
{
  std::string str="Programming";
  printallSubstrings(str);
  return 0;
}