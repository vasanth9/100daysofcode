//https://dev.to/sandordargo/the-big-stl-algorithms-tutorial-for-each-4k1d 
#include<iostream>
#include<algorithm>
#include<vector>

using namespace std;

int  main()
{
  vector<char> alphabets ={'a','b','c','d','x','y','z'};
  for_each(alphabets.begin(),alphabets.end(),[](char& c){
   c=(c-32); 
  });
  
}