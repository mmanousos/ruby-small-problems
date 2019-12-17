=begin
*assignment*
Array Average
Write a method that takes one argument, an array containing integers, and
returns the average of all numbers in the array. The array will never be empty
and the numbers will always be positive integers.

Examples:
  puts average([1, 5, 87, 45, 8, 8]) == 25
  puts average([9, 47, 23, 95, 16, 52]) == 40
  The tests above should print true.

*problem*
  input: array of integers (always positive, never empty array)
  output: average of all numbers in array
  sum array, but also count elements
  divide sum by count
  return quotient

*examples / test cases *
see above

*data structures*
  receive array
  return single integer

*algorithm*
START
  declare method(array)
  count = array.count
  sum = array.sum
  average = sum / count
END
=end

def average(integers)
  count = integers.count
  sum = integers.sum
  average = sum / count
end

puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

#Further Exploration
=begin
Currently, the return value of average is an Integer. When dividing numbers,
sometimes the quotient isn't a whole number, therefore, it might make more sense
to return a Float. Can you change the return value of average from an Integer to
a Float?

def average(integers)
  count = integers.count
  puts "count: #{count}"
  sum = integers.sum.to_f
  puts "sum: #{sum}"
  average = sum / count
end

puts average([1, 5, 87, 45, 8, 8]) > 25.0
puts average([9, 47, 23, 95, 16, 52]) > 40.0
=end
