=begin
*assignment*
Multiplicative Average
Write a method that takes an Array of integers as input, multiplies all the
numbers together, divides the result by the number of entries in the Array, and
then prints the result rounded to 3 decimal places. Assume the array is
non-empty.

Examples:
show_multiplicative_average([3, 5])
The result is 7.500

show_multiplicative_average([6])
The result is 6.000

show_multiplicative_average([2, 5, 7, 11, 13, 17])
The result is 28361.667

*problem*
input: array of integers
output: float rounded to three decimal places
float is the average of the array integer product

*examples / test cases *
see above

*data structures*
array of integers and float

*algorithm*
BEGIN
  declare method that takes a single array of integers as an argument
    multiply all the integers
    divide the product by the number of integers in the array (array.size)
    formated to 3 decimal places
    PRINT rounded average
END
=end

def show_multiplicative_average(int_arr)
  num = int_arr.size * 1.0
  product = int_arr.inject(:*)
  puts format('%.3f', product / num)
end

def show_multiplicative_average(int_arr)
  num = int_arr.size.to_f
  product = int_arr.inject(:*)
  puts format('%.3f', product / num)
end

# Course Solution - same logic as mine with more verbose format: they converted
# the product to a float where I adjusted the size of the array to a float
def show_multiplicative_average(numbers)
  product = 1.to_f
  numbers.each { |number| product *= number }
  average = product / numbers.size
  puts format('%.3f', average)
end

# Further Exploration
# What happens if you omit the call to #to_f on the first line of our method?

# Leaving out the Numeric#to_f method would cause the product and thus the
# average to be calculated as an integer, rounding down so all three decimal
# places would always return as 000.  

show_multiplicative_average([3, 5]) # => '7.500'
show_multiplicative_average([6]) # => '6.000'
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => '28361.667'
