Wordy
Write a program that takes a word problem and returns the answer as an integer.

E.g.

What is 5 plus 13?
The program should return 18.

What is 7 minus 5 minus 1?
The program should return 1.

Remember, that these are verbal word problems, not treated as you normally would treat a written problem. This means that you calculate as you move forward each step. This means 3 + 2 * 3 = 15, not 9.

Hint: to solve this problem elegantly, you need to know how the `send` method works in Ruby. If you haven't seen it before, check it out [here](http://stackoverflow.com/questions/3337285/what-does-send-do-in-ruby) .

Problem
in: string containing operators 'plus', 'minus', 'multiplied by', 'divided by'
and numbers as integers.
out: integer representing the mathematical operation described in the string

rules:
numbers can be positive or negative
if string does not contain any of the operators, raise an ArgumentError


Example / Tests
'What is -1 plus -10?' => -11

Data Structure
data types: string to integer
string & hash for constant

Algorithm
BEGIN
  string as argument
  SET constant with hash of operator strings and their mathematical equivalents
  raise ArgumentError if string does not contain any of the operator strings

  substitute the operator strings for their mathematical equivalents
  use regex to strip out anything that is not the mathematical operator or an integer
  evaluate the string
END
