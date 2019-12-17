=begin
*assignment*
Rotation (Part 2)
Write a method that can rotate the last n digits of a number. For example:

rotate_rightmost_digits(735291, 1) == 735291
rotate_rightmost_digits(735291, 2) == 735219
rotate_rightmost_digits(735291, 3) == 735912
rotate_rightmost_digits(735291, 4) == 732915
rotate_rightmost_digits(735291, 5) == 752913
rotate_rightmost_digits(735291, 6) == 352917
Note that rotating just 1 digit results in the original number being returned.

You may use the rotate_array method from the previous exercise if you want.
(Recommended!)

You may assume that n is always a positive integer.

*problem*
input: two integers - integer1 is the number to be altered, integer2 is the
digits place which should be rotated to the end of the number
output: integer with one digit moved from within the number to the end

- using rotate_array method
convert integer to array
split array into subarrays at point specified by integer2
apply rotate_array to second subarray only
join to a string and convert to integer

- without rotate_array method
split integer into array
  either use .digits (and reverse so integer digit order is maintained)
  or use .to_s and .chars
move backward from the end of the array to remove the appropriate digit
(-integer2)
insert removed digit at the end of the array
rejoin array and convert back into integer

*examples / test cases *
see above

*data structures*
integer to array to string to integer

*algorithm*
BEGIN

END
=end

# My Solution for pt1
def rotate_array(array)
  arr2 = []
  arr2.concat(array[1..-1]) << array[0]
end

# using substrings and only converting the string that needs to be rotated to an
# array - rotating the appropriate character, then using String#tr to replace
# the original value with the rotated value
def rotate_rightmost_digits(int, position)
  int_str = int.to_s
  to_shift = int_str.slice(-position..-1)
  shifting = to_shift.chars
  shifted = rotate_array(shifting).join
  int_str.tr(to_shift, shifted).to_i
end

# Breaks integer into a new array of digits. breaks into subarrays by popping
# off the last n elements. rotates them and adds them back on to the end, joins
# them to a string and then back into an integer.
def rotate_rightmost_digits(int, position)
  int_arr = int.digits.reverse
  shifting = int_arr.pop(position)
  int_arr.concat(rotate_array(shifting)).join.to_i
end

# same as above but using slice to Array#slice to avoid mutating int_arr
def rotate_rightmost_digits(int, position)
  int_arr = int.digits.reverse
  shifting = int_arr.slice(-position..-1)
  keeping = int_arr.slice(0...-position)
  keeping.concat(rotate_array(shifting)).join.to_i
end

# Course Solution - creates a subarray of only the values to be altered then
# rotates them using reassginment and joins to string then converts to integer
def rotate_rightmost_digits(number, n)
  all_digits = number.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits.join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
