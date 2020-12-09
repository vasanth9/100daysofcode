//https://dev.to/sandordargo/the-big-stl-algorithms-tutorial-allof-anyof-noneof-28dl 
//http://www.cplusplus.com/reference/algorithm/all_of/
#include<iostream>
#include<vector>
#include<algorithm>
using namespace std;

int main()
{
  vector<int>V={1,3,5,7,9,11};
  if(all_of(V.begin(),V.end(),[](int i){return i%2==1;}))
  {
    cout<<"The vector contains only odd numbers"<<endl;
  }
  else{
    cout<<"The vector is not entirely odd numbers"<<endl;
  }
  if(none_of(V.begin(),V.end(),[](int i){return i%2==0;}))
  {
    cout<<"The vector doesn't contain even numbers"<<endl;
  }
  else{
    cout<<"contains even numbers"<<endl;
  }
}