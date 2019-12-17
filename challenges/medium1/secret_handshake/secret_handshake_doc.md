Secret Handshake
Write a program that will take a decimal number, and convert it to the appropriate sequence of events for a secret handshake.

There are 10 types of people in the world: Those who understand binary, and those who don't. You and your fellow cohort of those in the "know" when it comes to binary decide to come up with a secret "handshake".

1 = wink
10 = double blink
100 = close your eyes
1000 = jump

10000 = Reverse the order of the operations in the secret handshake.

handshake = SecretHandshake.new 9
handshake.commands # => ["wink","jump"]

handshake = SecretHandshake.new "11001"
handshake.commands # => ["jump","wink"]
The program should consider strings specifying an invalid binary as the value 0.

Problem
convert decimals or strings of binary digits to binary
specific binary converts to strings as outlined above
commands method returns an array of these strings
but if the binary is 10000 or higher, the order of the strings is reversed in the array  

Example / Tests


Edge cases: anything that is not a string of binary should be treated as 0

Data Structure
input: integer or string of binary
output: empty array or array of strings corresponding to handshake terms  

Algorithm
BEGIN
check if argument is a string or integer
  IF string
    check: if any characters are not 0 or 1, return 0
    convert to an integer

  IF integer
    convert to binary:
    set array x, y = []
    divide integer % 2 until x == 0
    push y into array
    reverse final array
    convert all integers to strings, join and convert back to an integer


  case statement to convert values to corresponding strings   
END
