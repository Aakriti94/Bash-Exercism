# Darts

Write a function that returns the earned points in a single toss of a Darts game.

[Darts](https://en.wikipedia.org/wiki/Darts) is a game where players
throw darts to a [target](https://en.wikipedia.org/wiki/Darts#/media/File:Darts_in_a_dartboard.jpg).

In our particular instance of the game, the target rewards with 4 different amounts of points, depending on where the dart lands:

* If the dart lands outside the target, player earns no points (0 points).
* If the dart lands in the outer circle of the target, player earns 1 point.
* If the dart lands in the middle circle of the target, player earns 5 points.
* If the dart lands in the inner circle of the target, player earns 10 points.

The outer circle has a radius of 10 units (This is equivalent to the total radius for the entire target), the middle circle a radius of 5 units, and the inner circle a radius of 1. Of course, they are all centered to the same point (That is, the circles are [concentric](http://mathworld.wolfram.com/ConcentricCircles.html)) defined by the coordinates (0, 0).

Write a function that given a point in the target (defined by its `real` cartesian coordinates `x` and `y`), returns the correct amount earned by a dart landing in that point.

This particular exercise, since it deals with floating point arithmetic, is natural to rely on external tools (see below). As an extra challenging challenge, find a way to implement this with plain bash.


## Solution

#### <u> Approach to solution </u>

We are given two coordinates ```x``` and ```y``` and we need to determine where the dart has landed on the board and output the points according to that.

We can calculate the distance of two given coordinates from the origin (0, 0) using the formula,
```
√ x2 + y2 -> square root [(x*x) + (y*y)]
```

The radius of the inner circle is ```1``` . All the coordinates (x,y) falling inside the inner circle is would have distance between 0 and 1 by using the above formula.

|                  |Radius|Points|distance|
|       :-:        |  :-: | :-:  |  :-:   |
|inner circle      |   1  |  10  |>=0 && <=1|
|middle circle     |   5  |   5  |>=1 && <=5|
|outer circle      |  10  |   1  |>=5 && <=10|
|outside the target|  >10 |   0  |>=10|

   - We would first compute the distance of the given coordinates from the origin.

   - Then we would check in which circle the dart is falling in. It would give us the location where the dart hits the board.

   - Then we would output the points as per the given chart.

#### <u> Declaration </u>

<br>

Assigning values of command-line arguments to ```x``` and ```y```. <br>
```re``` holds the regular expression to validate a number (positive, negative and decimal.)
```
x="$1"
y="$2"
distance=0
square=0
re='^[+-]?[0-9]+([.][0-9]+)?$'
```

#### <u> Functions </u>

<br>

- ```function calculations()```

  Here, we are calculating the distance of the given coordinates. <br>
   ```a``` calculates the square of x. <br>
   ```b``` calculates the square of y. <br>
   ```square``` adds ```a``` and ```b```. <br>
   ```distance``` calculates the square root of value stored in ```square``` <br>
   We are calculating the formula ```√ x2 + y2```  in steps because ```x``` and ```y``` could be negative and in decimal and bash does not handle decimal and negative numbers.  
   ```
   function calculations() {
     a=$(echo "$x * $x" | bc -l)
     b=$(echo "$y * $y" | bc -l)
     square=$(echo "$a + $b" | bc -l)
     distance=$(awk -v x=$square 'BEGIN{print sqrt(x)}')
   }
   ```

- ```function output()```

  Here we are using ```if-else``` to check the distance of the coordinates from the origin and output the points earned.

#### <u> Execution </u>

The arguments provided should only be number (positive, negative and decimal).
Our scripts checks if the arguments provided follow the above mentioned condition.

Firstly, we will check if ```x``` is not a number (positive, negative and decimal). If the condition stands true, the script would echo an error. Else, it would check same for ```y``` and when both the conditions are not passed, it would go in the else block to call Functions ```calculations``` and ```output``` to calculate and then output the points earned.
```
if ! [[ $x =~ $re ]] ; then
   echo "error: Invalid arguments";
else
  if ! [[ $y =~ $re ]] ; then
    echo "error: Invalid arguments";
  else
    calculations
    output
  fi
fi
```

Here, we are using the reverse technique to determine if the arguments ```x``` and ```y``` are numbers. If ```x``` is not a number, we would echo an error and the program will not proceed further. Same check would happen for ```y```. If the program does not pass the two checks means our arguments are valid numbers and would further proceed to the script.


## Test cases and output

```
./darts.sh -9 9
0

./darts.sh 0 10
1

./darts.sh -5 0
5

./darts.sh 0 -1
10

./darts.sh 0 0
10

./darts.sh -0.1 -0.1
10

./darts.sh 0.7 0.7
10

./darts.sh 0.8 -0.8
5

./darts.sh -3.5 3.5
5

./darts.sh -3.6 -3.6
1

./darts.sh -7.0 7.0
1

./darts.sh 7.1 -7.1
0

./darts.sh 0.5 -4
5

./darts.sh
error: Invalid arguments

./darts.sh 10
error: Invalid arguments

./darts.sh foo 10
error: Invalid arguments

./darts.sh 10 bar
error: Invalid arguments
```

## challenges I faced:

- The Main challenge of this program is to handle decimal and negative numbers.
