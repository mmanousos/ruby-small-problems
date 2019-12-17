=begin
*assignment*
Does My List Include This?
Write a method named include? that takes an Array and a search value as
arguments. This method should return true if the search value is in the array,
false if it is not. You may not use the Array#include? method in your solution.

include?([1,2,3,4,5], 3) == true
include?([1,2,3,4,5], 6) == false
include?([], 3) == false
include?([nil], nil) == true
include?([], nil) == false

*problem*
input: array and search value (can be any datatype)
output: boolean

(recreating the built-in 'include?' method)
loop through the values represented by the elements in the array to check if
they match the provided value
if yes
  return true
else
  return false
(use ternary expression)

*examples / test cases *
see above

*data structures*
array

*algorithm*
BEGIN
  declare method that takes one array and one value as arguments
    WHILE there are elements remaining in the array to check
      compare each element individually to the second argument value
      IF the array element == argument value
        PRINT true
      ELSE
        PRINT false
    end
END
=end

# simple loop
def include?(array, check_val)
  counter = 0
  loop do
    break if counter >= array.size
    if array[counter] == check_val
      return true
    end
    counter += 1
  end
  false
end

# each in place of loop
def include?(array, check_val)
  array.each do |el|
    if el == check_val
      return true
    end
  end
  false
end

# fewer lines for above
def include?(array, check_val)
  array.each { |el| return true if el == check_val }
  return false
end

# Course Solution - coerces results of find_index to boolean
def include?(array, value)
  !!array.find_index(value)
end

# Further Exploration
# Additional solution using Enumerable#find
def include?(array, check_val)
  array.find { |el| return true if el == check_val }
  return false
end

# FAILS This simple check using include does not satisify the criteria because
# if the argument value is not found within the provided array, 'nil' is
# returned. Then it can not be determined if that 'nil' value is the result of
# the method failing or the value from the array.
=begin
def include?(array, check_val)
  present = array.find { |el| el == check_val }
end
=end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false
