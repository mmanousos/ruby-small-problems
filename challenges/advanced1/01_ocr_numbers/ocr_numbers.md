Write a program that, given a 3 x 4 grid of pipes, underscores, and spaces, can determine which number is represented, or whether it is garbled.

Step One
To begin with, convert a simple binary font to a string containing 0 or 1. The binary font uses pipes and underscores, four rows high and three columns wide.

 _   #
| |  # zero.
|_|  #
     # the fourth row is always blank
Is converted to "0"

   #
|  # one.
|  #
   # (blank fourth row)
Is converted to "1"

If the input is the correct size, but not recognizable, your program should return '?'. If the input is the incorrect size, your program should return an error.

Problem
convert print numbers to digits
" _\n| |\n|_|\n" === '0'
"\n |\n |\n" === '1'
if there are 4 rows (3 \n characters) but does not contain _ | | |_| or  | | return '?'
if more or fewer than 3 \n characters => error

Example / Tests


Algorithm
BEGIN
  raise argument error if the size of the array % 3 != 0 (some number that is not a multiple of 3)
  return '?' if doesn't match patterns above

in: underscores, pipes, spaces
out: string of numbers (and commas)

break into groups of 3 characters
join every section of 3 into a single number character and match it to the NUMBERS array

get size of groups array and divide by 3 = x
iterate over groups array and pull every x element & append to a string
evaluate each of those strings against the NUMBERS array
return the number or '?' if there is no match
END




Step Two
Update your program to recognize multi-character binary strings, replacing garbled numbers with ?

Step Three
Update your program to recognize all numbers 0 through 9, both individually and as part of a larger string.

 _
 _|
|_

Is converted to "2"

  _  _     _  _  _  _  _  _  #
| _| _||_||_ |_   ||_||_|| | # decimal numbers.
||_  _|  | _||_|  ||_| _||_| #
                             # fourth line is always blank
Is converted to "1234567890"

Step Four
Update your program to handle multiple numbers, one per line. When converting several lines, join the lines with commas.

    _  _
  | _| _|
  ||_  _|

    _  _
|_||_ |_
  | _||_|

 _  _  _
  ||_||_|
  ||_| _|

Is converted to "123,456,789"
