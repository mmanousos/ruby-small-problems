=begin
*assignment*
Fibonacci Numbers (Last Digit)
In the previous exercise, we developed a procedural method for computing the
value of the nth Fibonacci numbers. This method was really fast, computing the
20899 digit 100,001st Fibonacci sequence almost instantly.

In this exercise, you are going to compute a method that returns the last digit
of the nth Fibonacci number.

Examples:
fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
fibonacci_last(123456789) # -> 4

*problem*
input: integer representing the nth place of the Fibonacci sequence
output: integer representing the last digit of the nth value of the Fibonacci sequence

*examples / test cases *
see above

*data structures*
array

*algorithm*
BEGIN
  declare method that takes one integer (nth) as an argument
    SET first, last = [1, 1] array holding first two numbers in the Fibonacci sequence
    3.upto(nth) do
      first, last = [last, first + last]
    end

    SET final_value_arr = last split into digits
    PRINT last digit of final_value_arr array
    (last.digits.reverse.last)
END


def fibonacci_last(nth)
  first, last = [1, 1]
  3.upto(nth) do
    first, last = [last, first + last]
  end

  last.digits.first
end

def fibonacci_last(nth)
  first, last = [1, 1]
  3.upto(nth) do
    first, last = [last, first + last]
  end

  last.digits.reverse.last
end

# Course Solution - version 1: same idea as mine but converting to a string
# instead of an array to get the value of the last digit
def fibonacci_last(nth)
  fibonacci(nth).to_s[-1].to_i
end
=end
# Course Solution - version 2: only calculates and stores the last digit of each
# intermediate value
def fibonacci_last(nth)
  last_2 = [1, 1]
  3.upto(nth) do
    last_2 = [last_2.last, (last_2.first + last_2.last) % 10]
  end

  last_2.last
end

# Further Exploration
=begin
After a while, even this method starts to take too long to compute results. Can
you provide a solution to this problem that will work no matter how big the
number? You should be able to return results almost instantly. For example, the
123,456,789,987,745th Fibonacci number ends in 5.
=end

# pulled from other students' solutions. apparently the last number of the
# Fibonacci sequence repeats every 60 values, so by getting the remainder from
# the nth value divided by 60, this process can be reduced significantly. It is
# strange that the calculation for 123,456,789 still takes substantially longer
# than the same calculation for the much larger 123,456,789.987,745.
def fibonacci_last_instant(nth)
  fibonacci_last(nth % 60)
end

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4
p fibonacci_last_instant(123456789987745) # -> 5
