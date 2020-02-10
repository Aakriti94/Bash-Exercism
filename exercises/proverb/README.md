# Proverb

For want of a horseshoe nail, a kingdom was lost, or so the saying goes.

Given a list of inputs, generate the relevant proverb. For example, given the list `["nail", "shoe", "horse", "rider", "message", "battle", "kingdom"]`, you will output the full text of this proverbial rhyme:

```text
For want of a nail the shoe was lost.
For want of a shoe the horse was lost.
For want of a horse the rider was lost.
For want of a rider the message was lost.
For want of a message the battle was lost.
For want of a battle the kingdom was lost.
And all for the want of a nail.
```

Note that the list of inputs may vary; your solution should be able to handle lists of arbitrary length and content. No line of the output text should be a static, unchanging string; all should vary according to the input given.

## Solution

Declare an array named ```array_of_inputs```.
```sh
declare -a array_of_inputs
```

Give the entire command line argument as an input to the array ```array_of_inputs```
```sh
array_of_inputs=$@
```

Store the length of the array in variable ```length_of_array```
```sh
length_of_array=$#
```

Now, begin a ```for``` loop, that would iterate from ```i = 1``` to ```i < (length_of_array)```.

Now we are echoing the first half of the message ```echo -n "For want of a" "${!i}"``` . ```-n``` is used to terminate the beginning of a new line. Here, ```"${!i}"``` will take value ```i=1```.

```(( i++ ))``` - Incrementing the value of ```i```

Now, echoing the second half of the message, ```echo " the" "${!i}" "was lost."```. Here, the value of ```i``` would be ```i=2```. And the message would not begin from a new line because we have use ```-n``` in the last ```echo``` command.

```(( i-- ))``` - Decrementing the value of ```i```. Hence, ```i=1```.

Now, we are checking if any command line argument was provided, by checking the length of the array. If command line arguments are provided, it would echo a message with first command line argument ```$1``` (Our last line of the proverb). Else, it would echo a empty string.
```sh
if [[ $length_of_array > 0 ]]; then
  echo "And all for the want of a" "$1""."
else
  echo ""
fi

```

## Test cases and output

```
./proverb.sh
```
```
./proverb.sh nail
And all for the want of a nail.
```
```
./proverb.sh nail shoe
For want of a nail the shoe was lost.
And all for the want of a nail.
```
```
./proverb.sh nail shoe horse
For want of a nail the shoe was lost.
For want of a shoe the horse was lost.
And all for the want of a nail.
```
```
./proverb.sh nail shoe horse rider message battle kingdom
For want of a nail the shoe was lost.
For want of a shoe the horse was lost.
For want of a horse the rider was lost.
For want of a rider the message was lost.
For want of a message the battle was lost.
For want of a battle the kingdom was lost.
And all for the want of a nail.
```
```
./proverb.sh pin gun soldier battle
For want of a pin the gun was lost.
For want of a gun the soldier was lost.
For want of a soldier the battle was lost.
And all for the want of a pin.
```
```
./proverb.sh "rusty nail" "horse shoe"
For want of a rusty nail the horse shoe was lost.
And all for the want of a rusty nail.
```
```
./proverb.sh quotes "*"
For want of a quotes the * was lost.
And all for the want of a quotes.
```
