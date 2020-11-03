# Hello World

The classical introductory exercise. Just say "Hello, World!".

The objectives are simple:
- Write a function that returns the string "Hello, World!".

## Solution

We can simply display "Hello, World!" using  ``` echo ``` command. 

``` echo Hello, World! ```

The output: ```Hello, World!``` 

Here, in my solution, I have declared a function ``` hello_world() ``` and  initialised a variable ```var``` as ```var='Hello, World!'```.

```sh
function hello_world() {
  var='Hello, World!'
}
```

Coming to the execution part of script, 

```sh
var=''
hello_world
echo $var
```

Bash will assign a varaible ```var``` as empty. The line ```hello_world``` would call the function ```hello_world()```. Now the value of the variable ```var``` would be "Hello, World!" as variables have a global scope in bash unless defined locally.

Now, with the statement ```echo $var``` we are echoing (calling or displaying) the value of variable ```var```. 

The output: ```Hello, World!``` 



## Source

This is an exercise to introduce users to using Exercism [http://en.wikipedia.org/wiki/%22Hello,_world!%22_program](http://en.wikipedia.org/wiki/%22Hello,_world!%22_program)



