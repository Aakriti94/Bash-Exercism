# Resistor Color Duo

If you want to build something using a Raspberry Pi, you'll probably use _resistors_. For this exercise, you need to know two things about them:

* Each resistor has a resistance value.
* Resistors are small - so small in fact that if you printed the resistance value on them, it would be hard to read.
To get around this problem, manufacturers print color-coded bands onto the resistors to denote their resistance values. Each band acts as a digit of a number. For example, if they printed a brown band (value 1) followed by a green band (value 5), it would translate to the number 15.

In this exercise, you are going to create a helpful program so that you don't have to remember the values of the bands. The program will take two colors as input, and output the correct number.

The band colors are encoded as follows:

- Black: 0
- Brown: 1
- Red: 2
- Orange: 3
- Yellow: 4
- Green: 5
- Blue: 6
- Violet: 7
- Grey: 8
- White: 9

##  Solution

```shopt -s nocasematch``` when turned on does a case-insensitive search. <br>
Read about the nocasematch setting in [The Shopt Builtin](https://www.gnu.org/software/bash/manual/bash.html#The-Shopt-Builtin) and [Dealing with case sensitive pattern.](https://bash.cyberciti.biz/guideDealing_with_case_sensitive_pattern/)

Here, we declare a function ```resistor_color_duo``` and call it two times with different command line arguments.

```sh
resistor_color_duo "$1"
resistor_color_duo "$2"
```
Here, we are calling function ```resistor_color_duo``` first with argument ```$1``` and then with argument ```$2```

<u>Function:</u>

We are declaring a function,
```sh
function resistor_color_duo() {
}
```

Inside it we are implementing a switch case which will match color passed as argument, and echo the respective number.

<u>Implementation:</u>

- We pass arguments ```Black Red``` while we call out script.
```sh
./resistor_color_duo.sh Black Red
```

- ```$1``` will have a value of ```Black```, and ```$2``` will have a value of ```Red```.
- First the program will call the function ```resistor_color_duo "$1"``` with argument ```$1```
- inside the function, the argument passed in the line ```case "$1" in``` is ```$1``` i.e. ```black```. It will search for case matching with Black and execute it.
Here, we will match,
<<<<<<< HEAD
```
black )
=======
```sh
[B,b]lack )
>>>>>>> cb39b4d5097a3698b21983711a2fe1a4d3c7f0f7
echo -n "0"
  ;;
```

  and echo ```0```. In the line ```echo -n "0"```  ```-n```  do not output the trailing newline. In simple words, it does not insert a new line ```\n``` at the end of the ```echo``` command and we see out entire output in the same line. For  more information, read [here.](https://www.shellscript.sh/tips/echo/)

- If none of the case matches, we will output ```invalid color``` and ```exit``` the program.

- ```[B,b]rown``` searches both the cases, ```Brown``` and ```brown```

<u> Output: </u>

```
./resistor_color_duo.sh brown black
10
```

```
./resistor_color_duo.sh blue grey
68
```
```
./resistor_color_duo.sh yellow violet
47
```

```
./resistor_color_duo.sh orange orange
33
```
```
./resistor_color_duo.sh foo
invalid color
```

```
./resistor_color_duo.sh green brown orange
51
```


## Problems I ran into:

- ##### Problem with case-insensitive search in ```[B,b]lack )```

  After a mentor in exercism pointed out that my script is accepting "black" or "Black" or ",lack" for colour code 0.

  ```
  ./resistor_color_duo.sh brown ,lack
  10
  ```

  We can clearly see that my script is accepting "black" or "Black" or ",lack", which is an error. <br>
  To resolve this I used ```shopt -s nocasematch``` which turns on the case insensitive search in case statements.

   For more information read about the nocasematch setting in [The Shopt Builtin](https://www.gnu.org/software/bash/manual/bash.html#The-Shopt-Builtin) and [Dealing with case sensitive pattern.](https://bash.cyberciti.biz/guideDealing_with_case_sensitive_pattern/)
