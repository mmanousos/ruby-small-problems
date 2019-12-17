The Greek mathematician Nicomachus devised a classification scheme for natural numbers, identifying each as belonging uniquely to the categories of abundant, perfect, or deficient. A perfect number equals the sum of its positive divisors — the pairs of numbers whose product yields the target number, excluding the number itself. This sum is known as the Aliquot sum.

Perfect: Sum of factors = number
Abundant: Sum of factors > number
Deficient: Sum of factors < number

Examples:
6 is a perfect number because its divisors are 1, 2, 3 and 6 = 1 + 2 + 3.
28 is a perfect number because 28 = 1 + 2 + 4 + 7 + 14.
Prime numbers 7, 13, etc are deficient by the Nicomachus classification.
Write a program that can tell if a number is perfect, abundant or deficient.

Problem
determine if a number is "perfect", "abundant", or "deficient"
'perfect' numbers are those which have divisors that also sum to equal the number.
'deficient' numbers' factors do not equal them when summed; 'abundant' numbers' factors sum is greater than the number itself.

Example / Tests
6: divisors are 1, 2, 3 and 1 + 2 + 3 = 6
28: divisors are 1, 2, 4, 7, 14 and 1 + 2 + 4 + 7 + 14 = 28

prime numbers are inherently deficient because they can only be divided by 1 and themselves, which means the sum will never add up to the number

Data Structure


Algorithm
BEGIN
given a positive integer as an argument

calculate all factors
select (1..integer-1) each value
 if integer % value == 0
 

sum factors

if sum == number: 'perfect'
if sum > number: 'abundant'
if sum < number: 'deficient'
END
