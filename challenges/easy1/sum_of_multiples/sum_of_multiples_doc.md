Sum of Multiples
Write a program that, given a number, can find the sum of all the multiples of particular numbers up to but not including that number.

If we list all the natural numbers up to but not including 20 that are multiples of either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18. The sum of these multiples is 78.

Write a program that can find the sum of the multiples of a given set of numbers. If no set of numbers is given, default to 3 and 5.

Problem

given number
given factors (maybe)

if only number is given, calculate with 3 & 5 as the factors
if number and factors are given, use those values

there can be an unlimited number of factors

create a class method that takes a number as an argument
create an instance method that takes unlimited number of factors as an argument

Example / Tests

number = 20
factors = 3, 5 (default values if none are provided)
values = 3, 5, 6, 9, 10, 12, 15, and 18
sum = 78

edge cases:
numbers < 0
floats
non numeric values

Algorithm
BEGIN
arguments are number (n) and factors (x, y)
SET possible_values = 1..n
for each of the factors
  iterate over possible_values array
    with an object << select values that are % current multiple == 0
merge / flatten all selected arrays  
sum resulting 1d array
END
