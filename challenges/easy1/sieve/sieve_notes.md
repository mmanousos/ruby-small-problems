Sieve of Eratosthenes
Write a program that uses the Sieve of Eratosthenes to find all the primes from 2 up to a given number.

The Sieve of Eratosthenes is a simple, ancient algorithm for finding all prime numbers up to any given limit. It does so by iteratively marking as composite (i.e. not prime) the multiples of each prime, starting with the multiples of 2.

Create your range, starting at two and continuing up to and including the given limit. (i.e. [2, limit]).

The algorithm consists of repeating the following over and over:

take the next available unmarked number in your list (it is prime)
mark all the multiples of that number (they are not prime)
Repeat until you have processed each number in your range. When the algorithm terminates, all the numbers in the list that have not been marked are prime. The wikipedia article has a useful graphic that explains the algorithm (https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes).

Notice that this is a very specific algorithm, and the tests don't check that you've implemented the algorithm, only that you've come up with the correct list of primes.

Problem
  find primes from 2 to a given number (n)
  [2..limit]
  loop through the range
    iterate through each multiple of the current number
    removing each value from the range if it equals the current product.
  resulting values in the array after all values have been checked is the list of primes up to n

Example / Tests

n = 8
2, 3, 5, 7

edge cases:
n is negative
n is less than 2
n is not a whole number (#integer?)

Data Structure
arrays


Algorithm
  BEGIN
    create array of all integers from 2..n
    SET integer = first value
    SET multipliers = 1..n
    iterate through the array
      SET product = integer * first value of multipliers
      break if product > n
      multiply through range of multipliers
        remove value if integers array contains product
    return array of remaining integers     
  END

n = 8
[2, 3, 4, 5, 6, 7, 8]
2 * 2 # => [2, 3, 5, 6, 7, 8]
2 * 3 # => [2, 3, 5, 7, 8]
2 * 4 # => [2, 3, 5, 7]

3 * 2 # => [2, 3, 5, 7]
3 * 3 > n

4 * 2 # doesn't exist
5 * 2 > n
6 * 2 > n
7 * 2 > n
8 * 2 > n 
