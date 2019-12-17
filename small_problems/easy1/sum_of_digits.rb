=begin
*assignment*
Sum of Digits
Write a method that takes one argument, a positive integer, and returns the sum
of its digits.

Examples:
  puts sum(23) == 5
  puts sum(496) == 19
  puts sum(123_456_789) == 45
The tests above should print true.

For a challenge, try writing this without any basic looping constructs (while,
until, loop, and each).

*problem*
input: positive integer (assume no non-integers or negative numbers)
output: single integer that is the sum of its digits

*examples / test cases*
see above

*data structures*
integer to array
join back to integer to return

*algorithm*
easy way: use built in #digits method to split integer into Array
use built in #sum method to add all digits and return

harder way: convert to String, #split into array, map each element to a new
array, reduce that new array and return the value.
=end

#easy way
def sum(int)
  int.digits.sum
end
=begin
#harder way
def sum(int)
  int.to_s.split('').map(&:to_i).reduce(:+)
  # can use #chars in place of #split('') for tying less
end
=end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
