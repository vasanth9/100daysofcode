//https://dev.to/sandordargo/the-big-stl-algorithms-tutorial-allof-anyof-noneof-28dl
//http://www.cplusplus.com/reference/algorithm/any_of/
#include<iostream>
#include<algorithm>
#include<vector>
using namespace std;
int main()
{
  auto nums={1,2,3,4,5};
  if(any_of(begin(nums),end(nums), [](int i){return i == 3;}))
  {
    cout<<"3 is in list"<<endl;
  }
  else 
  {
    cout<<"3 is not in the list"<<endl;
  }
 vector<int>v={0,-9,8,-99,8,7,5,3,9};
 if(any_of(v.begin(),v.end(),[](int i){
   return i<0;
 }))
 {
   cout<<"There are negative numbers in the vector";
 }
}