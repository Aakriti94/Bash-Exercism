# D&D Character

For a game of [Dungeons & Dragons][DND], each player starts by generating a
character they can play with. This character has, among other things, six
abilities; strength, dexterity, constitution, intelligence, wisdom and
charisma. These six abilities have scores that are determined randomly. You
do this by rolling four 6-sided dice and record the sum of the largest three
dice. You do this six times, once for each ability.

Your character's initial hitpoints are 10 + your character's constitution
modifier. You find your character's constitution modifier by subtracting 10
from your character's constitution, divide by 2 and round down.

Write a random character generator that follows the rules above.

For example, the six throws of four dice may look like:

* 5, 3, 1, 6: You discard the 1 and sum 5 + 3 + 6 = 14, which you assign to strength.
* 3, 2, 5, 3: You discard the 2 and sum 3 + 5 + 3 = 11, which you assign to dexterity.
* 1, 1, 1, 1: You discard the 1 and sum 1 + 1 + 1 = 3, which you assign to constitution.
* 2, 1, 6, 6: You discard the 1 and sum 2 + 6 + 6 = 14, which you assign to intelligence.
* 3, 5, 3, 4: You discard the 3 and sum 5 + 3 + 4 = 12, which you assign to wisdom.
* 6, 6, 6, 6: You discard the 6 and sum 6 + 6 + 6 = 18, which you assign to charisma.

Because constitution is 3, the constitution modifier is -4 and the hitpoints are 6.

## Notes

Most programming languages feature (pseudo-)random generators, but few
programming languages are designed to roll dice. One such language is [Troll].

[DND]: https://en.wikipedia.org/wiki/Dungeons_%26_Dragons
[Troll]: http://hjemmesider.diku.dk/~torbenm/Troll/

## Solution

#### <u> Steps to solve the problem</u>
  1.  Roll a dice four times.
      > a=4, b=2, c=5, d=1

  2.  Take sum of the largest three numbers on the dice. Lets say we keep the sum in varaible called ```sum```
      > sum = a + b +c = 11

  3.  Do step 1 and 2, six times. We will do it six times because we need values for six abilities. (strength, dexterity, constitution, intelligence, wisdom and charisma.) <br>

  4. Find constitution modifier. <br>
     > constitution modifier = [[ value of the ability 'constitution' - 10 ] / 2 ] <br>
     RoundDown(constitution modifier)

  5. Find Hitpoints for your character.
     > Hitpoints = 10 + constitution modifier

  6. Generate a character that displays values of the six abilities and hitpoint.
      > ./dnd_character.sh generate

  7. Generate the value of ```constitution modifier``` when given with the value of ```constitution``` ability.
     > ./dnd_character.sh modifier 3 <br>
      -4

  Below is the table of what should be the value of constitution modifier with the provided value of constitution :

  |constitution|constitution modifier|
  |:-----------:|:---------------------:|
  |3 |-4|
  |4|-3|
  |5|-3|
  |6|-2|
  |7|-2|
  |8|-1|
  |9|-1|
  |10|0|
  |11|0|
  |12|1|
  |13|1|
  |14|2|
  |15|2|
  |16|3|
  |17|3|
  |18|4|

<br>

#### <u> Declaration </u>

```
#declaring a array named 'array'
declare -a array

#declaring a array named 'character_array'
declare -a character_array=(0 1 2 3 4 5)

sum=0
counter=0
cm=0
hitpoints=0
```

#### <u> Functions </u>

- Function ```roll_a_dice_fourtimes``` <br>

  This function generates a random number between 1 to 6 and stores it in an array named ```array```. The loop goes for four times, to generate 4 random numbers on the throw of a dice.

  ```
  function roll_a_dice_fourtimes() {
    for (( j = 1; j < 5; j++ )); do
      array[j]=$((1 + RANDOM%6))
      #echo "dice"$[j]": "${array[j]}
      #echo ${array[j]}
    done
  }
  ```


- Function ```smallest_no``` <br>

  This function generates the smallest number obtained by function ```roll_a_dice_fourtimes``` and stored in array ```array```.

  ```
  function smallest_no() {
    if [ ${array[1]} -lt ${array[2]} ] && [ ${array[1]} -lt ${array[3]} ] && [ ${array[1]} -lt ${array[4]} ]; then
      smallest=${array[1]}
    else
      if [ ${array[2]} -lt ${array[3]} ] && [ ${array[2]} -lt ${array[4]} ]; then
        smallest=${array[2]}
      else
        if [ ${array[3]} -lt ${array[4]} ]; then
          smallest=${array[3]}
        else
          smallest=${array[4]}
        fi
      fi
    fi
    #echo "smallest: "$smallest
  }
  ```

- Function ```sum_of_largest_three_no``` <br>

  This function calculates the sum of the largest three numbers obtained by function ```roll_a_dice_fourtimes```.

  ```
  function sum_of_largest_three_no() {
    for (( k = 1; k < 5; k++ )); do
      if [[ ${array[k]} -ne $smallest ]]; then
        sum=$((sum + array[k]))
        (( counter++ ))
      fi
    done

    if [[ $counter -eq 2 ]]; then
      sum=$((sum + $smallest))
    elif [[ $counter -eq 1 ]]; then
      sum=$((sum + $smallest + $smallest))
    elif [[ $counter -eq 0 ]]; then
      sum=$(($smallest + $smallest + $smallest))
    fi
    #echo "counter: "$counter
    #echo "sum: "$sum
    character_array[i]=$sum
    #echo ${character_array[i]}
    sum=0
    counter=0
    smallest=0
  }
  ```

  <b> Case 1: We have four different numbers on rolling the dice. </b> <br>
    > a = 5, b = 4, c =1, d = 3

    In this, we loop for four times (since we have four number to generate) and compare each number with the smallest number. As long as the compared value is not equal to the smallest number, it is added to the variable ```sum```. <br>
    We can see that the smallest value is ```c=1```, so ```sum=a+b+d```, ```sum=12```.

  <b> Case 2: We have three different numbers on rolling the dice. </b>
  > a = 1, b = 4, c = 1, d = 3

  Now, as we see we have a confusion deciding which one is the smallest number as both ```a=1``` and ```c=1```. So, to check if we have a case like this, we add a variable ```counter``` and increment its value every time a number is added to ```sum```. Going by the logic of our function ```smallest_no``` both ```a``` and ```c``` would not be added to the ```sum```. Hence,
  > sum = 7 <br>
    counter = 2

    Now, we will check if the ```counter=2```, and we would match the condition ```if [[ $counter -eq 2 ]];``` and add the smallest number to our ```sum```. Now, ```sum=8```

  <b> Case 3: We have two different numbers on rolling the dice. </b>
  > a = 1, b = 4, c = 1, d = 1

  Now, as we see we have a confusion deciding which one is the smallest number as  ```a=1```, ```d=1``` and ```c=1```. Going by the logic of our function ```smallest_no``` both ```a```, ```c``` and ```d``` would not be added to the ```sum```. Hence,
  > sum = 4 <br>
    counter = 1

    Now, we will check if the ```counter=1```, and we would match the condition ```elif [[ $counter -eq 1 ]]``` and, add the smallest number two times to our ```sum```. Now, ```sum=6```.

    <b> Case 4: We have all same numbers on rolling the dice. </b> <br>
    > a = 1, b = 1, c = 1, d = 1

    In this case, we would not go inside the ```for``` loop, and we would match the condition ```elif [[ $counter -eq 0 ]]``` and ```sum``` would add the smallest number stored in variable ```smallest``` three times.

    We then assign the value of ```sum``` to ```character_array[i]```. So, it stores the value as score for <i>'ability[i]'</i>. If ```i=0``` it would represent <i>'strength'</i> and so on..


- Function ```constitution_modifier_and_hitpoints```
  ```
  function constitution_modifier_and_hitpoints() {
    step_one=$((character_array[2]-10))
    div=$((step_one/2))
    mod=$((step_one%2))

    if [ $mod -ne 0 ] && [ $step_one -lt 0 ]; then
      div=$((div - 1))
      #echo $((div - 1))
    #else
      #echo $div
    fi

    hitpoints=$((10 + div))
    #echo $hitpoints
  }
  ```
  - It takes the value assigned to ability ```constitution``` i.e ```character_array[2]``` , and subtract ```10``` from it. <br> Divide ```step_one``` by 2 and store it a variable ```div``` and store the remainder in variable ```mod``` . ```div``` is our constitution modifier before rounding it off.
    ```
    step_one=$((character_array[2]-10))
    div=$((step_one/2))
    mod=$((step_one%2))
    ```
  - In this step we are rounding off our constitution modifier stored in ```div``` . <br>
  Now we are checking for negative numbers ```[ $step_one -lt 0 ]``` and negative numbers which are odd ```[ $mod -ne 0 ]```. <br>
  If we find an odd negative number, we subtract 1 from it and store it in variable ```div```. Else, we do nothing and get our constitution modifier after we implement round off functionality.

  - We finally calculate ```hitpoints=$((10 + div))``` .

  <br>

- Function ```generate_a_character```
  ```
  function generate_a_character() {
    constitution_modifier_and_hitpoints
    echo ""
    echo "strength:" ${character_array[0]}
    echo "dexterity:" ${character_array[1]}
    echo "constitution:" ${character_array[2]}
    echo "intelligence:" ${character_array[3]}
    echo "wisdom:" ${character_array[4]}
    echo "charisma:" ${character_array[5]}
    echo "hitpoints:" $hitpoints
    echo ""
  }
  ```

  In this we call our function ```constitution_modifier_and_hitpoints``` , which will give us value for ```hitpoints```. <br>
  Rest we are just displaying the values of the abilities of the character, stored in array ```character_array``` .
 <br>

#### <u> Execution </u>

- We are following a ```for``` loop until the length of ```character_array``` (No. of abilities), and we are calling function ```roll_a_dice_fourtimes``` , ```smallest_no``` and ```sum_of_largest_three_no``` to calculate value for each of the abilities. <br>
Since, we have 6 abilities, the loop will go 6 times and will roll a dice four times, for each iteration and then calculate the smallest number and then calculate the sum of largest three no.  for each iteration.

- If the the script runs with ```./dnd_character.sh generate``` ,  we will call the ```function generate_a_character``` which will display us all the values of the abilities along side their names.

- If the the script runs with ```./dnd_character.sh modifier n``` , we would assign the value of ```n``` passed along side modifier to ```character_array[2]=$2``` . The ```n``` passed is referred to as ```$2``` because it the second command-line argument. <br>
Call the ```function constitution_modifier_and_hitpoints``` and echo the value of the constitution modifier stored in variable ```div``` .


## Test Cases and Output

```
./dnd_character.sh modifier 3
-4

./dnd_character.sh modifier 4
-3

./dnd_character.sh modifier 5
-3

./dnd_character.sh modifier 6
-2

./dnd_character.sh modifier 7
-2

./dnd_character.sh modifier 8
-1

./dnd_character.sh modifier 9
-1

./dnd_character.sh modifier 10
0

./dnd_character.sh modifier 11
0

./dnd_character.sh modifier 12
1

./dnd_character.sh modifier 13
1

./dnd_character.sh modifier 14
2

./dnd_character.sh modifier 15
2

./dnd_character.sh modifier 16
3

./dnd_character.sh modifier 17
3

./dnd_character.sh modifier 18
4

./dnd_character.sh generate
strength: 16
dexterity: 10
constitution: 16
intelligence: 14
wisdom: 15
charisma: 0
hitpoints: 13

```

### Challenges
- <b>Round up/down function - </b> I have had really a tough time doing the rounding off, of the constitution modifier, what I failed to understand was weather the program wanted was a round up or a round down and I automatically assumed it was a round up which is the default rounding off functionality. But in this program, we need to round down the value and not use the default case. After hours of searching on internet, I finally came up with my code to round off.
