# Sum of Two Integers
# Task
# Given Two intgers a, b, find The sum of them, BUT You are not allowed to use the operators + and -
#
# Notes
# The numbers (a,b) may be positive, negative values or zeros.
#
# Returning value will be integer.
#
# Input >> Output Examples
# Add (5,19) ==> return (24)
# Add (-27,18) ==> return (-9)
# Add (-14,-16) ==> return (-30)
# https://www.codewars.com/kata/sum-of-two-integers
#
# in: two integers (a & b)
# out: single integer: sum of a + b without using + or -
# a & b can be positive, negative or zero
#
# AL:
# return other integer if either a or b is 0
# if a == a.abs && b == b.abs
#   b = a.times { b.succ }





def add_numbers(x, y)
  # return the other value if either are 0
  if x == 0 || y == 0
     x == 0 ? (return y) : (return x)
  end

  sum = 0
  # if both are positive
  if (x == x.abs && y == y.abs) || y < 0 && x > 0
    sum = y
    # x.times { sum.succ }
    x.times { sum = sum.succ }
    return sum
  # if both are negative
  elsif x < 0 && y < 0
    sum = y
    x.abs.times { sum = sum.pred }
    return sum
  # only x is negative
  else x < 0
    sum = x
    y.times { sum = sum.succ }
    return sum
  end
end

p add_numbers(0, 0) == 0
p add_numbers(0, 2) == 2
p add_numbers(5, 19) == 24
p add_numbers(-27, 18) == -9
p add_numbers(27, -18) == 9
p add_numbers(-14, -16) == -30

p add_numbers(-13,13) == 0
p add_numbers(-27,18) == -9
p add_numbers(-90,30) == -60

p add_numbers(1, 2) == 3
p add_numbers(5,19) == 24
p add_numbers(23,17) ==  40

p add_numbers(-14,-16) ==  -30
p add_numbers(-50,-176)  == -226
p add_numbers(-10,-29) ==  -39
