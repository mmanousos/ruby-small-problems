=begin
*assignment*
Fibonacci Number Location By Length
The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...) such
that the first 2 numbers are 1 by definition, and each subsequent number is the
sum of the two previous numbers. This series appears throughout the natural
world.

Computationally, the Fibonacci series is a very simple series, but the results
grow at an incredibly rapid rate. For example, the 100th Fibonacci number is
354,224,848,179,261,915,075 -- that's enormous, especially considering that it
takes 6 iterations before it generates the first 2 digit number.

Write a method that calculates and returns the index of the first Fibonacci
number that has the number of digits specified as an argument. (The first
Fibonacci number has index 1.)

Examples:
find_fibonacci_index_by_length(2) == 7
find_fibonacci_index_by_length(10) == 45
find_fibonacci_index_by_length(100) == 476
find_fibonacci_index_by_length(1000) == 4782
find_fibonacci_index_by_length(10000) == 47847

You may assume that the argument is always greater than or equal to 2.

*problem*
input: integer
output: integer

calculate the Fibonacci numbers, then count the length of them.
break the loop when the length is equal to the number provided in the argument.
return the index of the number that meets that criteria.

*examples / test cases *
see above

*data structures*
integers

*algorithm*
BEGIN
  declare method that takes one integer as an argument
    SET first = 1
    SET second = 1
    SET index = 2
    SET fib = 0
    WHILE length of fib < integer
      fib = first + second
      IF fib.length == integer
        return index
      ELSE
        first = second
        second = fib
        increment index += 1
END
=end

def find_fibonacci_index_by_length(int)
  first = 1
  second = 1
  index = 2

  loop do
    fib = first + second
    index += 1
    break if fib.to_s.size == int
    first = second
    second = fib
  end

  index
end

p find_fibonacci_index_by_length(2) == 7
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847
