=begin
*assignment*
Sum Square - Square Sum
Write a method that computes the difference between the square of the sum of the
first n positive integers and the sum of the squares of the first n positive
integers.

Examples:
sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
sum_square_difference(10) == 2640
sum_square_difference(1) == 0
sum_square_difference(100) == 25164150

*problem*
input: integer n
output: integer that is the difference between the square of the sum of 1..n
digits and the sum of the square of 1..n digits

n is always positive

*examples / test cases *
see above

*data structures*
array

*algorithm*
BEGIN
  declare a method that accepts a single positive integer (num) as an argument
    SET arr = (1..num).to_a create an array of all digits 1 to num
    SET sum_squared = the sum of all digits squared
    SET squared_sum = the square of each digit added together
    PRINT sum_squared - squared_sum
END
=end

def sum_square_difference(num)
  arr = (1..num).to_a
  sum_squared = arr.reduce(:+)**2
  squared_sum = arr.map { |digit| digit**2 }.reduce(:+)
  sum_squared - squared_sum
end

# single line
def sum_square_difference(num)
  (1..num).to_a.reduce(:+)**2 - (1..num).to_a.map { |el| el**2 }.reduce(:+)
end

# Course Solution - I appreciate that this solution only requires looping
# through the range a single time to generate all of the needed values
def sum_square_difference(n)
  sum = 0
  sum_of_squares = 0

  1.upto(n) do |value|
    sum += value
    sum_of_squares += value**2
  end

  sum**2 - sum_of_squares
end

p sum_square_difference(3) == 22
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
