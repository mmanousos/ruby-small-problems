=begin
*assignment*
Squaring an Argument
Using the multiply method from the "Multiplying Two Numbers" problem, write a
method that computes the square of its argument (the square is the result of
multiplying a number by itself).

Example:
square(5) == 25
square(-8) == 64
*problem*
input: single number
use that number to create two arguments to pass into a previously written
method, #multiply.
output: single number
Assume input is a valid number (not some other datatype).

*examples / test cases *
see above

*data structures*
integers

*algorithm*
START
  declare method that takes one argument as a number
    call previous method ('multiply') and pass in number as both required
    arguments
  end
END
=end

# from previous exercise
def multiply(num1, num2)
  num1 * num2
end

# new method for current exercise
def square(num)
  multiply(num, num)
end

square(5) # => 25
square(-8) # => 64

# Further Exploration
=begin
What if we wanted generalize this method to a "power to the n" type method:
cubed, to the 4th power, to the 5th, etc. How would we go about doing so while
still using the multiply method?

=> create a method that takes two arguments: the value we want to calculate and
the power to which we want to raise it.
Because the multiply method can only take two arguments, we use the number as
the first argument, and then the second argument is that number raised to the
power we're after minus 1.
This is probably not an ideal solution. There is likely a cleaner way.
(This was the first thing I came up with that still uses the 'multiply' method.
Simply writing a new method to use the built in ** calculation would be a
better option.)

def power(num, times)
  multiply(num, num**(times-1))
end

power(2, 3) # => 8
power(3, 9) # => 19683
=end
