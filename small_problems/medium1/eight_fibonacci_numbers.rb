=begin
*assignment*
Fibonacci Numbers (Recursion)
The Fibonacci series is a sequence of numbers starting with 1 and 1 where each
number is the sum of the two previous numbers: the 3rd Fibonacci number is
1 + 1 = 2, the 4th is 1 + 2 = 3, the 5th is 2 + 3 = 5, and so on.
In mathematical terms:

F(1) = 1
F(2) = 1
F(n) = F(n - 1) + F(n - 2) where n > 2
Sequences like this translate naturally as "recursive" methods. A recursive
method is one in which the method calls itself. For example:
def sum(n)
  return 1 if n == 1
  n + sum(n - 1)
end
sum is a recursive method that computes the sum of all integers between 1 and n.

Recursive methods have three primary qualities:
They call themselves at least once.
They have a condition that stops the recursion (n == 1 above).
They use the result returned by themselves.
In the code above, sum calls itself once; it uses a condition of n == 1 to stop
recursing; and, n + sum(n - 1) uses the return value of the recursive call to
compute a new return value.

Write a recursive method that computes the nth Fibonacci number, where nth is an
argument to the method.

Examples:
fibonacci(1) == 1
fibonacci(2) == 1
fibonacci(3) == 2
fibonacci(4) == 3
fibonacci(5) == 5
fibonacci(12) == 144
fibonacci(20) == 6765

*problem*
input: integer n representing the place in the Fibonacci sequence up to which to compute
output: integer representing the value of the nth value in the Fibonacci sequence

recursive method

return 1 if n == 1 or n == 2
SET counter = 3
create a hash to hold values
push sums calculated into hash with counter as their key
if n == 1; hash[1] => 1
if n == 2; hash[2] => 1
if n == 3; iterate through creating hash[1] and hash[2], then add hash[1] & hash[2] & push sum into hash at counter
if n == 4; iterate through creating hash[1], hash[2] & hash[3], then add hash[2] & hash[3] & push sum into hash at counter
if n == 5; iterate through creating hash[1], hash[2], hash[3] & hash[4], then add hash[3] & hash[4] & push sum into hash at counter
to get to nth place, must iterate through all of these steps so previous two values are available.


*examples / test cases *
see above

*data structures*
integers

*algorithm*
BEGIN
  declare a method that accepts one integer n as an argument
    PRINT 1 if n == 1 || n == 2
    SET counter = 3
    fibonacci_hash[counter] = fibonacci_hash[n-2] + fibonacci_hash[n-1]
    counter += 1



    SET val1 = 0
    SET val2 = 1
  # as a loop
    SET fib = val1 + val2
    IF counter == n
      PRINT fib
    ELSE
      val1 = val2
      val2 = fib
      counter += 1
      run the loop again


      n + fib(n - (n-1)) # to run with 1 as the argument - not what I want for this though.
END
=end

# Course Solution - I would not have thought to call the function twice
def fibonacci(nth)
  return 1 if nth <= 2
  fibonacci(nth - 1) + fibonacci(nth - 2)
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765
