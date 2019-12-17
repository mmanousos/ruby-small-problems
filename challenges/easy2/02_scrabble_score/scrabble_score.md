Write a program that, given a word, computes the scrabble score for that word.

Letter Values
You'll need these:

Letter                           Value
A, E, I, O, U, L, N, R, S, T       1
D, G                               2
B, C, M, P                         3
F, H, V, W, Y                      4
K                                  5
J, X                               8
Q, Z                               10

Examples
"cabbage" should be scored as worth 14 points:

3 points for C
1 point for A, twice
3 points for B, twice
2 points for G
1 point for E
And to total:

3 + 2*1 + 2*3 + 2 + 1
= 3 + 2 + 6 + 3
= 5 + 9
= 14

Problem:
we have a word composed of letters
each letter has a corresponding numeric value
calculate the value
sum all of the values
return the sum

Examples:
'cabbage' == 14
'luggage' == 10 (1 + 1 + 2 + 2 + 1 + 2 + 1)
'zipper' == 19 (10 + 1 + 3 + 3 + 1 + 1)

edge cases:
letters need to be capitalized to compare to the lookup table
'' == 0
nil == 0
"\n\t" == 0 (non-letter values are removed from the string)
non string values are converted to strings?

Data Structure:
hash look up table to hold letter and numerical values

in: string
out: integer - sum of string character values

Algorithm:
BEGIN
  SET HASH = arrays of letters as keys, numeric values as values

  SET word = argument
  strip non-letter values from word
  convert word to uppercase
  split uppercase into an array of characters
  iterate over array of characters
    map characters to corresponding values in lookup table
      check if each is present in each array of keys
  sum mapped array
  return sum
END    
