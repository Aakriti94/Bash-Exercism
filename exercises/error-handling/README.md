# Error Handling

Implement various kinds of error handling and resource management.

An important point of programming is how to handle errors and close
resources even if errors occur.

This exercise requires you to handle various errors. Because error handling is rather programming language specific you'll have to refer to the tests for your track to see what's exactly required.

## Solution

#### <u> Approach to solution</u> - (Test cases and output)

Here, we do not see any definitive thing to do. So, we need to refer to the test cases to find what exactly we are supposed to do.

We need to print a message "Hello, ```argument we provide```".  The conditions that need to followed are:
1. There should be only one argument. Here, the argument is ```Alice```
```
error_handling.sh Alice
Hello, Alice
```

2. we can give one long argument as long as it is only one argument. For a long argument to be taken as one argument, we need to enclose it in ```""```
```
error_handling.sh "Alice and Bob"
Hello, Alice and Bob
```

3. More than one argument would return an error.
```
error_handling.sh Alice Bob
Usage: ./error_handling <greetee>
```

4. It would return an error if no argument is provided.
```
error_handling.sh
Usage: ./error_handling <greetee>
```

5. Empty argument is treated as single argument and will return a string with empty argument.
```
error_handling.sh ""
Hello,
```

#### <u> Execution </u>

From the above cases we can deduce that we need to send an error if we don't have one argument.

So, we will check if the no. of command-line arguments is equal to one. If yes, the we would print the message along with the argument provided. Else, we would print an error message.
