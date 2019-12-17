# Sum Square - Square Sum
# Write a method that computes the difference between the square of the sum of the first n positive integers and the sum of the squares of the first n positive integers.

# in: integer
# out: difference
# (sum of squares of all numbers between 1-integer) - (square of sum of all numbers 1-integer)

# AL: create an array from 1 - integer
# square of sums = sum of range & square it
# sum of squares = mapped array of integers, reduced



def sum_square_difference(num)
  arr = (1..num).to_a
  arr.sum ** 2 - arr.map { |int| int**2 }.sum
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
