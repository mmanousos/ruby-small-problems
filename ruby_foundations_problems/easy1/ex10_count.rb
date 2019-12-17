=begin
Problem
Count Items
Write a method that takes an array as an argument, and a block that returns true
or false depending on the value of the array element passed to it. The method
should return a count of the number of times the block returns true.

You may not use Array#count or Enumerable#count in your solution.

Examples
count([1,2,3,4,5]) { |value| value.odd? } == 3
count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
count([1,2,3,4,5]) { |value| true } == 5
count([1,2,3,4,5]) { |value| false } == 0
count([]) { |value| value.even? } == 0
count(%w(Four score and seven)) { |value| value.size == 5 } == 2

Data Structure

Algorithm
  BEGIN
    array as argument
    SET counter = 0
    iterate over array
    yield each element to the block
    increment counter for each time block == true
    return counter
  END

=end

# def count(array)
#   counter = 0
#   array.each { |el| counter += 1 if yield(el) }
#   counter
# end

# Further Exploration
# Write a version of the `count` method that meets the conditions of this
# exercise, but also does not use `each`, `loop`, `while`, or `until`.

def count(array)
  counter = 0
  array.size.times { |el| counter += 1 if yield(array[el]) }
  counter
end

def count(array)
  counter = 0
  0.upto(array.size - 1) { |el| counter += 1 if yield(array[el]) }
  counter
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2
