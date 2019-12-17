=begin
*assignment*
Always Return Negative
Write a method that takes a number as an argument. If the argument is a positive
number, return the negative of that number. If the number is 0 or negative,
return the original number.

Examples:
negative(5) == -5
negative(-3) == -3
negative(0) == 0      # There's no such thing as -0 in ruby

*problem*
input: integer
output: negative integer (reverse of original positive integer, original
negative integer or 0 if original integer was 0)

check value of integer
  if > 0, return -integer
  else return integer

*examples / test cases *
see above

*data structures*
integers

*algorithm*
BEGIN
  declare method that takes a single integer as an argument
    IF integer > 0
      PRINT -integer
    ELSE
      PRINT integer
    end
END
=end

def negative(int)
  if int > 0
    -int
  else
    int
  end
end

# Course Solution - same logic, just using ternary expression
def negative(number)
  number > 0 ? -number : number
end

# Further Exploration
=begin
There is an even shorter way to write this but it isn't as immediately intuitive.

def negative(number)
  -number.abs
end

This works by flipping the problem on the head. It straightaway converts it to a
positive number with Numeric#abs and then prepends it with a negative operator
to make it negative. abs returns the absolute value of a number (the
non-negative value of a number without regard to its sign).

So instead of operating by checking the value and proceeding based on the
evaluation, the opposite can be applied by stripping it of its sign, then giving
it the negative sign.

This is clearly shorter. However is it superior?
=end

# No. Since this solution is less intuitive, it will be harder for others
# (including potentially the author in the future) to understand. Also, it
# performs unnecessary conversions (if the number is already negative or zero)
# and so is more "expensive". 

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0
