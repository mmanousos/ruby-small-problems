=begin
*assignment*
Multiplying Two Numbers
Create a method that takes two arguments, multiplies them together, and returns
the result.

Example: multiply(5, 3) == 15
*problem*
input: two integers
output: integer that is the product of the two integers
Assume valid integers are input (no other datatypes)

*examples / test cases *
see above
multiply(5, 3) => 15
multiply(0, 2) => 0
multiply(-2, -5) => 10

*data structures*
integers

*algorithm*
START
  declare method that takes two integers as arguments
    arg1 * arg2
  end
END
=end

def multiply(num1, num2)
  num1 * num2
end

p multiply(5, 3) # => 15
p multiply(0, 2) # => 0
p multiply(-2, -5) # => 10
p multiply(-2, 1) # => -2

# Further Exploration
=begin
For fun: what happens if the first argument is an Array? What do you think is
happening here?

multiply([1,2], 2) # => [1, 2, 1, 2]
The method is multiplying the elements referred to by the original argument.
