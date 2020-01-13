# Two Fer

`Two-fer` or `2-fer` is short for two for one. One for you and one for me.

Given a name, return a string with the message:

```text
One for X, one for me.
```

Where X is the given name.

However, if the name is missing, return the string:

```text
One for you, one for me.
```

Here are some examples:

|Name    |String to return
|:-------|:------------------
|Alice   |One for Alice, one for me.
|Bob     |One for Bob, one for me.
|        |One for you, one for me.
|Zaphod  |One for Zaphod, one for me.



## Solution 1:

We first echo a message to ask user to input a name.
```
echo "Please enter a name"
```

Read the user input ```read name``` with the variable ```name```

Checking if the given input is null or not,
```
if ! [[ -z "$name" ]];
```

If it is null, the ```else``` part gets executed. Else, the string provided is executed.

The output:

```
Please enter a name
Bob
One for Bob, one for me.

```

```
Please enter a name
Aakriti Kashyap
One for Aakriti Kashyap, one for me.

```

```
Please enter a name
*
One for *, one for me.
```

## Solution 2:

We first echo a message to ask user to input a name.
```
echo "Please enter a name"
```

Read the user input ```read name``` with the variable ```name```

Here, we echo the output, ```${name:-you}``` means, use value of variable name if provided. Else, use 'you' in the place of input for the output.
```
echo "One for ${name:-you}, one for me."
```

For More information, click [here.](https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html)
