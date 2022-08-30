#

## C++ things

1- reverse the string

```cpp
string s;
reverse(begin(a), end(a));
```

2- next_permutation

```cpp

vector<int> a;
do {
    cout << a << endl;
} while (next_permutation(begin(a), end(a)));

```

3- count thing in array

```cpp
cout(arr, arr+n , thing)
```

4- read line

```cpp
// 1
string s; getline(cin,s);

// 2
char c; cin >> c; if(c == 125)
```

### Count numbers form 1 to n

```cpp

// count numbers from 1 to n
// O(1)
int count_numbers(int n)
{
    return (n * (n + 1) / 2);
}

```
