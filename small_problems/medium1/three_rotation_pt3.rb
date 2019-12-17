=begin
*assignment*
Rotation (Part 3)
If you take a number like 735291, and rotate it to the left, you get 352917. If
you now keep the first digit fixed in place, and rotate the remaining digits,
you get 329175. Keep the first 2 digits fixed in place and rotate again to
321759. Keep the first 3 digits fixed in place and rotate again to get 321597.
Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to
get 321579. The resulting number is called the maximum rotation of the original
number.

735291 - original
352917 - largest digit rotated (0 index)
329175 - second largest (1 index)
321759 - third largest (2 index)
321597 - fourth largest (3 index)
321579 - fifth largest (4 index)

Write a method that takes an integer as argument, and returns the maximum
rotation of that argument. You can (and probably should) use the
rotate_rightmost_digits method from the previous exercise.

Example:
max_rotation(735291) == 321579
max_rotation(3) == 3
max_rotation(35) == 53
max_rotation(105) == 15 # the leading zero gets dropped
max_rotation(8_703_529_146) == 7_321_609_845

*problem*
input: integer
output: new integer maximally rotated

break integer to array of digits & reverse to maintain original digit order
size = size of array
number of times to rotate = size - 1
counter = 0
position = size - counter
while counter < num of times to rotate
  rotate_rightmost_digits(int, position)

*examples / test cases *
see above

*data structures*
integer to array to string to integer

*algorithm*
BEGIN
  declare method that takes a single integer (int) as an argument
    SET int_digits = integer broken into array of digits with original order
    SET arr_size = size of array
    SET max_rotations = arr_size - 1
    SET counter = 0
    WHILE counter < max_rotations
      SET position = arr_size - counter
      int = rotate_rightmost_digits(int, position)
      counter += 1
    end
    PRINT int
END
=end

# My Solution for pt1
def rotate_array(array)
  arr2 = []
  arr2.concat(array[1..-1]) << array[0]
end

# My Solution for pt2
def rotate_rightmost_digits(int, position)
  int_arr = int.digits.reverse
  shifting = int_arr.pop(position)
  int_arr.concat(rotate_array(shifting)).join.to_i
end

def max_rotation(int)
  int_digits = int.digits.reverse # unnecessary to assign to variable - only need size
  arr_size = int_digits.size
  max_rotations = arr_size - 1
  counter = 0
  while counter < max_rotations
    position = arr_size - counter
    int = rotate_rightmost_digits(int, position)
    counter += 1
  end
  int
end

# refactored to remove unnecessary variable assignment
def max_rotation(int)
  arr_size = int.digits.size
  max_rotations = arr_size - 1
  counter = 0
  while counter < max_rotations
    position = arr_size - counter
    int = rotate_rightmost_digits(int, position)
    counter += 1
  end
  int
end

# Course Solution - same logic but using Integer#downto instead of a basic loop
# - slightly more elegant
def max_rotation(number)
  number_digits = number.to_s.size
  number_digits.downto(2) do |n|
    number = rotate_rightmost_digits(number, n)
  end
  number
end

# Further Exploration
=begin
Assume you do not have the rotate_rightmost_digits or rotate_array methods. How
would you approach this problem? Would your solution look different? Does this 3
part approach make the problem easier to understand or harder?
=end

=begin
The three part approach certainly makes each piece easier to complete. But
ensuring the correct return value is produced to serve as input for the
following step can prove challenging without knowing in advance how the method
will be used subsequently.

Without the helper methods, the final method would almost certainly be longer.
(Creating helper methods might still be wise.) But I also might have
broken the problem down differently, rotating from the left instead of the right
(since this final 'Max Rotation' problem starts by rotating the first digit and
in from there).
=end

def max_rotation(num)
  arr_num = num.digits.reverse
  arr_size = arr_num.size
  counter = 0
  while counter < arr_size - 1
    curr = arr_num[counter]
    arr_num.delete_at(counter)
    arr_num << curr
    counter += 1
  end
  arr_num.join.to_i
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
