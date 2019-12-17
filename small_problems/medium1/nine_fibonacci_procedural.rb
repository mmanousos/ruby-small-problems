=begin
*assignment*
Fibonacci Numbers (Procedural)
In the previous exercise, we developed a recursive solution to calculating the
nth Fibonacci number. In a language that is not optimized for recursion, some
(not all) recursive methods can be extremely slow and require massive quantities
of memory and/or stack space.

Ruby does a reasonably good job of handling recursion, but it isn't designed for
heavy recursion; as a result, the Fibonacci solution is only useful up to about
fibonacci(40). With higher values of nth, the recursive solution is impractical.
(Our tail recursive solution did much better, but even that failed at around
fibonacci(8200).)

Fortunately, every recursive method can be rewritten as a non-recursive
(procedural) method.

Rewrite your recursive fibonacci method so that it computes its results without
recursion.

Examples:
fibonacci(20) == 6765
fibonacci(100) == 354224848179261915075
fibonacci(100_001) # => 4202692702.....8285979669707537501

*problem*
input: integer representing the nth place of the Fibonacci sequence
output: integer representing the nth place value of the Fibonacci sequence

*examples / test cases *
see above

*data structures*
hash

*algorithm*
BEGIN
  declare a method that accepts one integer n as an argument
    IF n <= 2
      PRINT 1
    ELSE
      SET fibonacci_hash = { 1 => 1, 2 => 1 }
      SET counter = 3
      WHILE counter < n
        fibonacci_hash[counter] = fibonacci_hash[counter - 2] + fibonacci_hash[counter - 1]
        IF counter == n
          PRINT fibonacci_hash[counter]
        ELSE
          increment counter += 1
        end
      end
    end
END
=end

# stores all the values in a hash. Really only need previous 2 values.
def fibonacci(num)
  if num <= 2
    1
  else
    fibonacci_hash = { 1 => 1, 2 => 1 }
    counter = 3
    while counter <= num
      fibonacci_hash[counter] = fibonacci_hash[counter - 2] + fibonacci_hash[counter - 1]
      if counter == num
        return fibonacci_hash[counter]
      else
        counter += 1
      end
    end
  end
end

# Course Solution - more streamlined version, similar logic, only storing 2
# previous numbers. Accounts for nth = 1 & nth = 2 by hardcoding them into the
# array to start, as I did with my hash values. 
def fibonacci(nth)
  first, last = [1, 1]
  3.upto(nth) do
    first, last = [last, first + last]
  end

  last
end

p fibonacci(2) == 1
p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501
