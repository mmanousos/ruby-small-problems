Series
Write a program that will take a string of digits and give you all the possible consecutive number series of length n in that string.

For example, the string "01234" has the following 3-digit series:

- 012
- 123
- 234

And the following 4-digit series:

- 0123
- 1234

And if you ask for a 6-digit series from a 5-digit string, you deserve whatever you get.


Problem
method that takes 2 arguments: string of digits & integer n
returns all consecutive digits of n length within the argument string
- store snippets into an array for return

Example
string = '57890'

3-digit series
578
789
890

4-digit series
5789
7890

6-digit series
ArgumentError

Data Structure
String & integer (n)
array of digits each n characters long

Algorithm
  BEGIN
    SET results = empty array
    convert string to array of individual digits
      string.to_i.digits.reverse
    iterate through array
      gather each consecutive n digits into results array   
    iterate through results array
      join each series to string & convert back to integer
    return results array       
  END

  BEGIN
    SET results = empty array
    split string into array of characters
    iterate through string array
      convert each character to an integer
    iterate through new integer array
      gather each consecutive n integers into results array
    return results array       
  END
