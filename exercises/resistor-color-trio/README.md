# Resistor Color Trio

If you want to build something using a Raspberry Pi, you'll probably use _resistors_. For this exercise, you need to know only three things about them:

- Each resistor has a resistance value.
- Resistors are small - so small in fact that if you printed the resistance value on them, it would be hard to read.
  To get around this problem, manufacturers print color-coded bands onto the resistors to denote their resistance values.
- Each band acts as a digit of a number. For example, if they printed a brown band (value 1) followed by a green band (value 5), it would translate to the number 15.
  In this exercise, you are going to create a helpful program so that you don't have to remember the values of the bands. The program will take 3 colors as input, and outputs the correct value, in ohms.
  The color bands are encoded as follows:

* Black: 0
* Brown: 1
* Red: 2
* Orange: 3
* Yellow: 4
* Green: 5
* Blue: 6
* Violet: 7
* Grey: 8
* White: 9

In `resistor-color duo` you decoded the first two colors. For instance: orange-orange got the main value `33`.
The third color stands for how many zeros need to be added to the main value. The main value plus the zeros gives us a value in ohms.
For the exercise it doesn't matter what ohms really are.
For example:

- orange-orange-black would be 33 and no zeros, which becomes 33 ohms.
- orange-orange-red would be 33 and 2 zeros, which becomes 3300 ohms.
- orange-orange-orange would be 33 and 3 zeros, which becomes 33000 ohms.

(If Math is your thing, you may want to think of the zeros as exponents of 10. If Math is not your thing, go with the zeros. It really is the same thing, just in plain English instead of Math lingo.)

This exercise is about translating the colors into a label:

> "... ohms"

So an input of `"orange", "orange", "black"` should return:

> "33 ohms"

When we get more than a thousand ohms, we say "kiloohms". That's similar to saying "kilometer" for 1000 meters, and "kilograms" for 1000 grams.
So an input of `"orange", "orange", "orange"` should return:

> "33 kiloohms"



## Solution

#### <u> Declaration </u>
Declare four variables with values
```sh
outputString=""
kiloohms=1000
megaohms=1000000
gigaohms=1000000000
```

```shopt -s nocasematch``` when turned on does a case-insensitive search. <br>
Read about the nocasematch setting in [The Shopt Builtin](https://www.gnu.org/software/bash/manual/bash.html#The-Shopt-Builtin) and [Dealing with case sensitive pattern.](https://bash.cyberciti.biz/guideDealing_with_case_sensitive_pattern/)

#### <u> Functions </u>

We have two functions here: ```function resistor_color_trio()``` and ```function conversion()```

- ```function resistor_color_trio()``` have a switch case to match the color to its respective value.

  ```case "$1"``` takes in parameter value and checks for the matched case in the cases given.

  ```black )``` searches for the input black (case-insensitive.)

  ```retval``` is the value returned by the color.


- ```function conversion()``` checks the value for its appropriate unit value (ohms, gigaohms, megaohms, kiloohms).

  Variable ```divide_gigaohms``` holds the value obtained by dividing the value of ```outputString``` by ```gigaohms``` i.e. ```1000```. Similarly, for ```divide_megaohms``` and ```divide_kiloohms```.

  Variable ```modulus_gigaohms``` holds the value obtained as a remainder by dividing the value of ```outputString``` by ```gigaohms``` i.e. ```1000```. Similarly, for ```modulus_megaohms``` and ```modulus_kiloohms```.

  Now, we want to print the highest unit for the value obtained. For that, we first divide it with the units (gigaohms, megaohms, kiloohms). The quotient of this division is stored in ```divide_gigaohms``` and remainder in ```modulus_gigaohms```.

  To print the value with the greatest unit, we want the division with '0' remainder. For that, we will check the quotient to be non-zero and the remainder to be zero.

  First we will check the value for the gigaohms. For it to be a gigaohm, it should be completely divisible by 1 gigaohm i.e. ```gigaohms=1000000000```

  If it is not completely divisible
  by ```gigaohms```, we will move on to the next unit i.e. ```megaohms```. Similarly, we will check for ```kiloohms```. If it does not satisfy any condition for any unit, then simply print the value with ```ohms```.


<br>

#### <u> Execution </u>

- Here, we are calling the function ```resistor_color_trio``` with the first command-line argument.
  ```sh
  resistor_color_trio "$1"
  ```
  By first command-line argument, we mean ```blue``` when we call our script,
  ```sh
  ./resistor_color_trio.sh Blue grey brown
  ```
  So, it goes in the function ```resistor_color_trio()``` and matches against case,
  ```sh
  blue )
  retval=6
    ;;
  ```

  Now,
  ```sh
  retvl=6
  outputString=60
  ```
  We are multiplying our ```retval``` by 10 so that the returned value '6' will go to tenths place and '0' takes the ones place. And, ```outputString``` becomes 60.

<br>

- Now, we are calling the function ```resistor_color_trio``` with the second command-line argument.
  ```sh
  resistor_color_trio "$2"
  ```

  By second command-line argument, we mean ```grey``` when we call our script,
  ```sh
  ./resistor_color_trio.sh Blue grey brown
  ```

  So, it goes in the function ```resistor_color_trio()``` and matches against case,
  ```sh
  grey )
  retval=8
    ;;
  ```

  In the next line, we add the ```retval``` to ```outputString```. So now, ```outputString=68```

  ```sh
  outputString=$((outputString + retval))
  ```   

  Now,
  ```sh
  retval=8
  outputString=68
  ```

- Now, we are calling the function ```resistor_color_trio``` with our third command-line argument.
  ```sh
  resistor_color_trio "$3"
  ```

  By third command-line argument, we mean ```brown``` when we call our script,
  ```sh
  ./resistor_color_trio.sh Blue grey brown
  ```
  So, it goes in the function ```resistor_color_trio()``` and matches against case,
  ```sh
  brown )
  retval=1
    ;;
  ```

  Now, we are multiplying ```outputString``` by power of 10 [ ```10**``` means Power of Ten. ] And power is defined by variable ```retval```. Since our last argument is ```brown```, ```retval=1```

  ```sh
  outputString="$((outputString * 10**retval))"

  ```

  Now,
  ```sh
  retval=1
  outputString=680
  ```

- Now, we call the function ```conversion```.

  In our case, ```./resistor_color_trio.sh Blue grey brown```
  ```sh
  divide_gigaohms=0
  divide_megaohms=0
  divide_kiloohms=0
  modulus_gigaohms= something but not zero
  modulus_megaohms= something but not zero
  modulus_kiloohms= something but not zero
  ```

  Now, we will check the ```if-else``` conditions and execute whichever is matched. In our case, the matched condition is ```else``` and we would ```echo``` ```680 ohms```.





## Test cases and output

```
./resistor_color_trio.sh Orange orange black
33 ohms

./resistor_color_trio.sh Blue grey brown
680 ohms

./resistor_color_trio.sh Brown red red
1200 ohms

./resistor_color_trio.sh Red black red
2 kiloohms

./resistor_color_trio.sh Green brown orange
51 kiloohms

./resistor_color_trio.sh Yellow violet yellow
470 kiloohms

./resistor_color_trio.sh Blue violet grey
6700 megaohms

./resistor_color_trio.sh black black black
0 ohms

./resistor_color_trio.sh white white white
99 gigaohms

./resistor_color_trio.sh white white baz
invalid color

./resistor_color_trio.sh foo white white
invalid color

./resistor_color_trio.sh white bar white
invalid color

./resistor_color_trio.sh black grey black
8 ohms

./resistor_color_trio.sh blue green yellow orange
650 kiloohms
```

## Problems I ran into:

- ##### Handling the ```outputString``` as string or number
  When we read the introduction of the exercise, it says,
  > If Math is your thing, you may want to think of the zeros as exponents of 10. If Math is not your thing, go with the zeros. It really is the same thing, just in plain English instead of Math lingo.

  So, I chose the plain English instead of maths for my first approach. Here, in the function ```resistor_color_trio``` I would return the number of zeros (associated with each color) as well. The switch statement would look something like this,
  ```sh
  case "$1" in
    black )
    retval=0
    zeros=""
      ;;
    brown )
    retval=1
    zeros=0
      ;;
    red )
    retval=2
    zeros=00
      ;;
  ```

  And, in the Execution part, I was appending strings with each other rather than calculating value of ```outputString```.
  ```sh
  resistor_color_trio "$1"
  outputString=${retval}

  resistor_color_trio "$2"
  outputString="${outputString}${retval}"

  resistor_color_trio "$3"
  outputString="${outputString}${zeros}"
  ```
  - In the case discussed above, ```Blue grey brown```. I would first append the value ```6``` in ```outputString```. -So, ```outputString=6```

  - Now, the second color return the value of ```8```. So, I would append ```8``` with ```6```. And now, the ```outputString=68```

  - The third color is ```brown``` which returns the value ```1```. So, one zero (```0```) will get appended in the ```outputString```. And, ```outputString=680```

  From now, when we go in the function ```conversion``` we would handle ```outputString``` as a number rather than a string. So,
  1. There was inconsistency in logic.
  2. There are some cases where the logic broke. Like the one discussed in next point.


<br>

- ##### Invalid octal number
  If we see the test case,
  ```sh
  resistor_color_trio.sh "black" "grey" "black"
  ```

  Our ```outputString``` would be ```outputString=08``` since, ```black``` return '0' zeroes.
  ```sh
  black )
  retval=0
  zeros=""
  ```
  And, ```0``` and ```8``` <b> makes an invalid octal number. </b> It would give an error like,
  ```text
   line 58: 08: value too great for base (error token is "08")
  ```

  So, take the safe road and deal it as a number right from the start and save a lot of time. Else, if you make it work right with strings, please share it with me as well. :)


  - ##### Problem with case-insensitive search in ```[B,b]lack )```

  After a mentor in exercism pointed out that my script is accepting "black" or "Black" or ",lack" for colour code 0.

  ```
  ./resistor_color_trio.sh ,range orange black
  33 ohms

  ./resistor_color_trio.sh ,range ,range ,lack
  33 ohms
  ```

  We can clearly see that my script is accepting "black" or "Black" or ",lack", which is an error. <br>
  To resolve this I used ```shopt -s nocasematch``` which turns on the case insensitive search in case statements.

   For more information read about the nocasematch setting in [The Shopt Builtin](https://www.gnu.org/software/bash/manual/bash.html#The-Shopt-Builtin) and [Dealing with case sensitive pattern.](https://bash.cyberciti.biz/guideDealing_with_case_sensitive_pattern/)
