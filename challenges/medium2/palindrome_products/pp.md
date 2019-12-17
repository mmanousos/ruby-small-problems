Write a program that can detect palindrome products in a given range.

A palindromic number reads the same both ways. The largest palindrome made from
the product of two 2-digit numbers (range 10 ~ 99) is 9009 = 91 x 99.

Problem
input: range of numbers
       may be min & max or just max value
       if only max, start from 1

output: array containing subarrays of all the possible numbers within the range that produce palindromic products.
palindromes do not need to occur within the range
  the products just need to be palindromes

methods:
generate - creates array of arrays?
largest - last element in array?
smallest - first element in array?

sub-methods:
value - product of first/last element in array? (whichever it was called on)
factors - product of first/last element in array? (whichever it was called on)

Example / Tests
max = 9 (so min = 1)
palindromes.generate => creates array of all possible palindromic factors
palindromes.largest => iterates over array of palindromic factors, multiplying them and returning the max (9)
largest.value => single value of largest (9)
largest.factors => [[[3, 3], [1, 9]], [[1, 9], [3, 3]]] nested arrays of all palindromic factors that produce that specific value

Data Structure
Array

Algorithm
- initialize: create palindromic range object
BEGIN
  set min value to 1 unless argument is provided
  range = min..max
  palindromes = {}
END

- generate: array of all possible palindromic factors
BEGIN
  create all possible 2-number combinations of the values within the range
  multiply each pair of numbers and check if they produce a palindrome
  if so, add factors as pair of values & product as value
END

- palindrome?
BEGIN
  convert value to string == value to string reversed  
END

- largest
BEGIN
  map to create new array of subarray products from palindrome_factors with index values
  sort largest to smallest by first element of each subarray
  get index of first sorted element (array[0][1])
  return that index value from the original palindrome_factors nested array
END

- smallest
BEGIN
  map to create new array of subarray products from palindrome_factors with index values
  sort smallest to largest by first element of each subarray
  get index of first sorted element (array[0][1])
  return that index value from the original palindrome_factors nested array
END

- value
BEGIN
  multiply the elements within the largest/smallest array and return the product
END

- factors
BEGIN
  SET value = #value
  select all subarrays from palindrome_factors where their product == value
END
