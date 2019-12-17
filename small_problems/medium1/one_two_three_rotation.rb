# One
# Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.

# Do not use the method Array#rotate or Array#rotate! for your implementation.

# in: array
# out: new array with original elements rotated by one place (0 index moved to end and all others shifted forward by 1)

# AL:
# clone original array
# shift 0 index element and push to end

def rotate_array(arr)
  new_arr = arr.clone
  a = new_arr.shift
  new_arr << a
end

# p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# p rotate_array(['a']) == ['a']

# x = [1, 2, 3, 4]
# p rotate_array(x) == [2, 3, 4, 1]#  == true
# p x == [1, 2, 3, 4]              #  == true

# Two
# Write a method that can rotate the last n digits of a number.

# in: multi-digit integer, integer n representing the number of digits from right to rotate (1 returns the same integer argument)
# out: multi-digit integer with n rightmost digits rotated

# AL: break the multi-digit integer argument into an array
# using the second integer argument, remove those digits from the end of the new array
# pass that new array into rotate_array & get the return value
# add the return value to the original array
# join to a string then to an integer and return.

def rotate_rightmost_digits(multi, places)
  arr = multi.digits.reverse
  to_rotate = arr.pop(places)
  arr.concat(rotated = rotate_array(to_rotate)).join.to_i
end

# p rotate_rightmost_digits(735291, 1) == 735291
# p rotate_rightmost_digits(735291, 2) == 735219
# p rotate_rightmost_digits(735291, 3) == 735912
# p rotate_rightmost_digits(735291, 4) == 732915
# p rotate_rightmost_digits(735291, 5) == 752913
# p rotate_rightmost_digits(735291, 6) == 352917

# Three
# Write a method that takes an integer as argument, and returns the maximum rotation of that argument. You can (and probably should) use the rotate_rightmost_digits method from the previous exercise.

# in: integer
# out: integer rotated maximum number of times
# maximum number of times is based on the length of the integer
# first number (zero index) is rotated to last place; then next number (one index); then next (two index)
#   rotations = 1 less than length of the integer

# 735291
# 352917
# 329175
# 321759
# 321597
# 321579

# AL: using rotate_rightmost_digits
# break int into an array
# set variable to hold size of array
# create a counter
# iterate over array, breaking when counter is 1 less than length of array
#   pass int and array size - counter into rotate_rightmost_digits
#   set int = return value of rotate_rightmost_digits
#   increment counter += 1

# return int

def max_rotation(int)
  arr = int.digits.reverse
  arr_size = arr.size
  counter = 0

  while counter < arr_size
    int = rotate_rightmost_digits(int, (arr_size - counter))
    counter += 1
  end

  int
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
