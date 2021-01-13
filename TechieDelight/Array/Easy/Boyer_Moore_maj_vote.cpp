/*https://www.techiedelight.com/find-majority-element-in-an-array-boyer-moore-majority-vote-algorithm/*/
/*https://en.wikipedia.org/wiki/Boyer%E2%80%93Moore_majority_vote_algorithm*/
#include<iostream>
#include<vector>
int majorityelement(std::vector<int>v)
{
  int n=v.size();
  int count=0;
  int elem;
  for(int i=0;i<n;i++)
  {
    if(count==0)
    {
        elem=v[i];
    }
    elem==v[i]?count++:count--;
  }
  std::cout<<count;
  return elem;
}


int main()
{
  //assumption that element present
std::vector<int>v={ 2, 8, 7, 2, 2, 5, 2, 3, 1, 2, 2 };
std::cout<<majorityelement(v)<<"\n";
/*Even when the input sequence has no majority, the algorithm will report one of the sequence elements as its result. However, it is possible to perform a second pass over the same input sequence in order to count the number of times the reported element occurs and determine whether it is actually a majority. This second pass is needed, as it is not possible for a sublinear-space algorithm to determine whether there exists a majority element in a single pass through the input.*/
}