# Leap

Given a year, report if it is a leap year.

The tricky thing here is that a leap year in the Gregorian calendar occurs:

```text
on every year that is evenly divisible by 4
  except every year that is evenly divisible by 100
    unless the year is also evenly divisible by 400
```

For example, 1997 is not a leap year, but 1996 is.  1900 is not a leap
year, but 2000 is.

Leap year rules:
1. Every year that is evenly divisible by 4.
2. Skip if it is a new century. Example: 100, 200, 300, 400, 500.
3. Unless the century is divisible by 400. Example: now 400 is a leap year but 100, 200, 300 and 500 are not.

For a delightful, four minute explanation of the whole leap year
phenomenon, go watch [this youtube video][video].

[video]: http://www.youtube.com/watch?v=xX96xng7sAE

## Solution 1:

- In the first line we declare a variable ```input``` and initialize it with a value of 0. ```input=0```
- We then define a regular expression to check if the input entered is number or not. ```re='^[0-9]+$'```
- Echoing a message ```echo "Please enter an year"```
- Reading input in the line ```read input```
- Here, we will use nested ```if-else``` .
- We will check if the input provided is number or not.
 ```
 if [[ $input =~ $re ]];
 ```
 If the input provided is a number, we will proceed. Else we would display the message ```echo "The input is not a number. Please input a number."``` and exit. A simple ```if-Else``` would look like this:
 ```
 if [[ $input =~ $re ]]; then
   #statements
 else
   echo "The input is not a number. Please input a number."
 fi
 ```
- First we will check the condition, ' every year that is evenly divisible by 4'. If the condition ```[ $(($input % 4)) -eq 0 ]``` is true, we will go further into the nested if. Else we will print that the, ```"The given year is not a leap year."``` . Example, 1997. A simple ```if-Else``` would look like,
```
if [[ $(($input % 4)) -eq 0 ]]; then
(Would add some other conditions here)
else
  echo "The given year is not a leap year."
fi
```

- If the condition ```[ $(($input % 4)) -eq 0 ]``` stands true, then we would check if the year is divisible by 100(then, it would not be a leap year unless divided by 400.), ```[ $(($input % 100)) -eq 0 ]``` . If it is divisible by 100, we would go in another nested ```if``` block, else we would print ```"The given year is a leap year."``` as the year would be divisible by 4 and not 100. Example, 1996. Now the code with this added condition would look like,
```
if [[ $(($input % 4)) -eq 0 ]]; then
  if [[ $(($input % 100)) -eq 0 ]]; then
    (Would add some other conditions here)
    fi
  else
    echo "The given year is a leap year."
  fi
else
  echo "The given year is not a leap year."
fi
```

- If the condition ```[ $(($input % 100)) -eq 0 ]``` stands true. Then we would test another condition, if the year is also evenly divisible by 400, then it is a leap year. Adding another nested if block to test the condition ```[  $(($input % 400)) -eq 0 ]```. If the condition stands true, then it is a leap year, else not. The final code look like,
```
if [[ $(($input % 4)) -eq 0 ]]; then
  if [[ $(($input % 100)) -eq 0 ]]; then
    if [[  $(($input % 400)) -eq 0 ]]; then
      echo "The given year is a leap year."
    else
      echo "The given year is not a leap year."
    fi
  else
    echo "The given year is a leap year."
  fi
else
  echo "The given year is not a leap year."
fi
```

The output:
```
Please enter an year
1996
The given year is a leap year.
```

```
Please enter an year
1997
The given year is not a leap year.
```

```
Please enter an year
1900
The given year is not a leap year.
```

```
Please enter an year
2000
The given year is a leap year.
```


## Solution 2:

To make our solution more precise and concise.

- In the first line we declare a variable ```input``` and initialize it with a value of 0. ```input=0```

- We then define a regular expression to check if the input entered is number or not. ```re='^[0-9]+$'```

- Echoing a message ```echo "Please enter an year"```

- Reading input in the line ```read input```

- Here we would use ```if-elif```

- We will check if the input provided is number or not.
 ```
 if [[ $input =~ $re ]];
 ```
 If the input provided is a number, we will proceed. Else we would display the message ```echo "The input is not a number. Please input a number."``` and exit. A simple ```if-Else``` would look like this:
 ```
 if [[ $input =~ $re ]]; then
   #statements
 else
   echo "The input is not a number. Please input a number."
 fi
 ```

- First we will check the condition ```[  $(($input % 400)) -eq 0 ]```, if the number is divisible by 400, ```The given year is a leap year.```

- If first condition fails then we will check the second condition, if a year is divisible by 100 ```[ $(($input % 100)) -eq 0 ]```, ```"The given year is not a leap year."```

- If second condition fails then we will check the third condition, if a year is divisible by 4, ```[ $(($input % 4)) -eq 0 ]```, ```"The given year is a leap year."```

- If none of the conditions satisfy, then ```else``` block would be executed, ```"The given year is  not a leap year."```


The output:
```
Please enter an year
1996
The given year is a leap year.
```

```
Please enter an year
1997
The given year is not a leap year.
```

```
Please enter an year
1900
The given year is not a leap year.
```

```
Please enter an year
2000
The given year is a leap year.
```
