=begin
*assignment*
Rotation (Part 1)
Write a method that rotates an array by moving the first element to the end of
the array. The original array should not be modified.

Do not use the method Array#rotate or Array#rotate! for your implementation.

Example:
rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true

*problem*
input: array of values
output: new array of values with the first element of the original array shifted
to be last


*examples / test cases *
see above

*data structures*
arrays

*algorithm*
BEGIN
  declare a method that takes a single array as an argument
    SET arr2 = array.copy
    SET first = array[0]
    arr2.shift.push(first)
END
=end

def rotate_array(array)
  arr2 = []
  first, rest = array.partition.with_index { |_, idx| idx < 1 }
  arr2.concat(rest).concat(first)
  arr2
end

def rotate_array(array)
  arr2 = []
  arr2.concat(array[1..-1]) << array[0]
end

# Course Solution - very simple way!
def rotate_array(array)
  array[1..-1] + [array[0]]
end

# p x = [1, 2, 3, 4]
# p rotate_array(x) == [2, 3, 4, 1]   # => true
# p x == [1, 2, 3, 4]                 # => true

# Further Exploration
# Write a method that rotates a string instead of an array. Do the same thing
# for integers. You may use rotate_array from inside your new method.

def rotate_string(string)
  arr = string.chars
  str = rotate_array(arr).join
end

p x = 'rotate'
p rotate_string(x) == 'otater'   # => true
p x == 'rotate'                  # => true

def rotate_integer(int)
  arr = int.digits.reverse
  return_integer = rotate_array(arr).join.to_i
end

p x = 1233
p rotate_integer(x) == 2331
p x == 1233
