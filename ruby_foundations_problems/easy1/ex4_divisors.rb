=begin
Problem

Write a method that returns a list of all of the divisors of the positive
integer passed in as an argument. The return value can be in any sequence
you wish.

Examples

divisors(1) == [1]
divisors(7) == [1, 7]
divisors(12) == [1, 2, 3, 4, 6, 12]
divisors(98) == [1, 2, 7, 14, 49, 98]
divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute

Data Structure

Algorithm
  BEGIN
    argument is a positive integer
    create new empty array to hold results
    create a range & increment from argument down to 1
    check each value as a divisor & if % == 0 add value to results array
  END

=end

# def divisors(integer)
#   results = []
#   1.upto(integer) { |number| results << number if integer % number == 0 }
#   results
# end

# # or, for results in reverse order:

# def divisors(integer)
#   results = []
#   integer.downto(1) { |number| results << number if integer % number == 0 }
#   results
# end

def divisors(integer)
  1.upto(integer).with_object([]) do |number, results|
    results << number if integer % number == 0
  end
end

# Further Exploration
# How fast can you make your solution go? How big of a number can you quickly
# reduce to its divisors? Can you make divisors(999962000357) return almost
# instantly? (The divisors are [1, 999979, 999983, 999962000357].) Hint: half
# of the divisors gives you the other half.

# Other students' solutions - both iterate only up to the square root of the
# integer - the second one adds both the number encountered and its divisor
# counterpart at the same time. This is a very slick solution and easy to read.
# The only change I would make is swapping `num**0.5` with `Math.sqrt(num)`
# because it's easier to understand.

# def divisors(num)
#   result = [1]
#   return result if num == 1
#
#   (2..Math.sqrt(num)).each do |div|
#     if num % div == 0
#       result << (num / div) unless (num / div) == num
#       result << div
#     end
#   end
#   (result << num).sort
# end

# def divisors(num)
#   1.upto(num**0.5).with_object([]) do |n, result|
#     result << n << num / n if (num % n).zero?
#   end.sort.uniq
# end

# def divisors(num)
#   1.upto(Math.sqrt(num)).with_object([]) do |n, result|
#     result << n << num / n if (num % n).zero?
#   end.sort.uniq
# end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
# p divisors(999962000357) == [1, 999979, 999983, 999962000357]
p divisors(9) == [1, 3, 9]
