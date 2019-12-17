=begin
*assignment*
Reversed Arrays (Part 2)
Write a method that takes an Array, and returns a new Array with the elements of
the original list in reverse order. Do not modify the original list.

You may not use Array#reverse or Array#reverse!, nor may you use the method you
wrote in the previous exercise.

Examples:
reverse([1,2,3,4]) == [4,3,2,1]          # => true
reverse(%w(a b c d e)) == %w(e d c b a)  # => true
reverse(['abc']) == ['abc']              # => true
reverse([]) == []                        # => true

list = [1, 2, 3]                      # => [1, 2, 3]
new_list = reverse(list)              # => [3, 2, 1]
list.object_id != new_list.object_id  # => true
list == [1, 2, 3]                     # => true
new_list == [3, 2, 1]                 # => true

*problem*
input: array
output: new array with the elements of the original array reversed (and original
array untouched)

*examples / test cases *
see above

*data structures*
arrays

*algorithm*
BEGIN
  declare a method that accepts a single array as an argument
    SET new_arr = [] empty new array to hold reversed elements
    WHILE there are elements in the array to examine
      get each element starting from position -1 and add it to the new array
END


# cycle forward adding each subsequent element to the front of the new array
def reverse(arr)
  new_arr = []
  arr.each { |el| new_arr.unshift(el) }
  new_arr
end

# the same process using Array#map
def reverse(arr)
  new_arr = []
  new_arr = arr.map { |el| new_arr.unshift(el) }
  # new_arr
end

# the same process using Array#each_with_object
def reverse(arr)
  new_arr = arr.each_with_object([]) { |el, new_arr| new_arr.unshift(el) }
end

# cycle backward adding each element to the end of the new array
def reverse(arr)
  new_arr = []
  arr_pos = -1
  while new_arr.size < arr.size
      new_arr << arr[arr_pos]
      arr_pos -= 1
  end
  new_arr
end

# Course Solution
# uses reverse_each which is just a more elegant version of my cycling backward
# solution because it cycles through the array from the back to the front adding
# each element it encounters to the end of the new array.
def reverse(array)
  result_array = []
  array.reverse_each { |element| result_array << element }
  result_array
end

# Further Exploration
=begin
An even shorter solution is possible by using either inject or each_with_object.
Just for fun, read about these methods in the Enumerable module documentation,
and try using one in your reverse method.
=end

# using Enumerable#inject
# I was unclear on how to use the Enumerable#inject method to solve this problem
# The example given in this answer on StackOverflow demonstrated creating a new
# hash from an array and then I understood that, as with Array#each_with_object,
# I could pass a new array to the method and then push my desired values to that
# new array as appropriate. https://stackoverflow.com/a/710514
def reverse(array)
  array.inject([]) { |new_array, el| new_array.unshift(el) }
end

# Looking at the student submitted solutions, this additional use of
# Enumerable#inject was even more streamlined but does require use of the
# Array#reverse_each method in conjunction with it.
def reverse(array)
  array.reverse_each.inject([],:<<)
end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b c d e)) == %w(e d c b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

p list = [1, 2, 3]                      # => [1, 2, 3]
p new_list = reverse(list)              # => [3, 2, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 2, 3]                     # => true
p new_list == [3, 2, 1]                 # => true
