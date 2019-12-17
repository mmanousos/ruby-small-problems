=begin
*assignment*
Find the Duplicate
Given an unordered array and the information that exactly one value in the array
occurs twice (every other value occurs exactly once), how would you determine
which value occurs twice? Write a method that will find and return the duplicate
value that is known to be in the array.

Examples:
find_dup([1, 5, 3, 1]) == 1
find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73

*problem*
input: array
output: single element

Our provided test cases are using integers, but ideally floats, strings or other
datatypes could be considered.

examine each value in turn setting that value as our element in question
from that index point forward, examine all remaining values for equality with
the element in question. If there is a match, return the value of the element in
question.

*examples / test cases *
see above

*data structures*
array to single value (integer according to the provided tests)

*algorithm*
BEGIN
  declare a method that takes a single array as an argument
    WHILE there are elements in the array left to evaluate
      cycle through each element of array with its index value
        SET el = element in question
        SET idx = index of el
        SET subarr = array of elements after current index to end
        loop through each value of subarr checking them == el
          IF ==
            break and return el
          ELSE
            continue to subsequent values in subarr
END
=end

# Solution that is destructive to the original array
def find_dup(array)
  while array.size > 0
    el = array.shift
    array.each do |val|
      return el if val == el
    end
  end
end

# non-destructive solution
def find_dup(array)
  counter = 0
  loop do
    break if counter == array.size
    el = array[counter]
    array.each_with_index do |val, idx|
      return el if val == el && idx != counter
    end
    counter += 1
  end
end

# more refined version of above
def find_dup(array)
  array.each_with_index do |el, idx|
    array.slice(idx+1..-1).each { |val| return el if el == val }
  end
end

# Course Solution
# uses Enumerable#find and Enumerable#count - gets the element in question and
# checks if there are two of it anywhere in the array.
def find_dup(array)
  array.find { |element| array.count(element) == 2 }
end

# Further Exploration
=begin
There are several ways to go about solving this problem. One other way would be
to have a separate array that keeps track of which items have been looked at as
we iterate through the original array. If we ever add the same item twice to
this second array, then we know that we have found a duplicate.
=end

def find_dup(array)
  checked_array = []
  array.each do |el|
    if checked_array.include?(el)
      return el
    else
      checked_array << el
    end
  end
end


p find_dup([1, 5, 3, 1]) == 1
p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73
