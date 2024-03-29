Trinary
Write a program that will convert a trinary number, represented as a string (e.g. '102012'), to its decimal equivalent using first principles (without using an existing method or library that can work with numeral systems).

Trinary numbers can only contain three symbols: 0, 1, and 2. Invalid trinary entries should convert to decimal number 0.

The last place in a trinary number is the 1's place. The second to last is the 3's place, the third to last is the 9's place, etc.

# "102012"
    1       0       2       0       1       2    # the number
1*3^5 + 0*3^4 + 2*3^3 + 0*3^2 + 1*3^1 + 2*3^0    # the value
  243 +     0 +    54 +     0 +     3 +     2 =  302

Problem

invalid values = anything that is not the digits 0-2
if invalid values are passed as arguments, return 0

Example / Tests
edge cases: > 3; < 0; strings of non digits; arrays or other data types

Data Structure
in: string representation of an integer
out: integer  

Algorithm
BEGIN
  SET trinary constant = 3
  return 0 if string contains any values that are not 0-2
  split string to characters, convert them to integers & reverse array
  iterate over digits array with index value
    sum array value * trinary constant ** index value
END
