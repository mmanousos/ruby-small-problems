=begin
*assignment*
Double Doubles
A double number is a number with an even number of digits whose left-side digits
are exactly the same as its right-side digits. For example, 44, 3333, 103103,
7676 are all double numbers. 444, 334433, and 107 are not.

Write a method that returns 2 times the number provided as an argument, unless
the argument is a double number; double numbers should be returned as-is.

Examples:
twice(37) == 74
twice(44) == 44
twice(334433) == 668866
twice(444) == 888
twice(107) == 214
twice(103103) == 103103
twice(3333) == 3333
twice(7676) == 7676
twice(123_456_789_123_456_789) == 123_456_789_123_456_789
twice(5) == 10

Note: underscores are used for clarity above. Ruby lets you use underscores when
writing long numbers; however, it does not print the underscores when printing
long numbers. Don't be alarmed if you don't see the underscores when running
your tests.

*problem*
input: integer
output: integer that is either the same as the input or the integer doubled.
only return the original integer if it has an even number of digits and the left
half of the digits are identical to the right half.

determine if the digits are even
  if not, double it.
  if yes, split the number in half and compare first to second half
    if first == second
      return integer
    else
      double it

*examples / test cases *
see above

*data structures*
integers

*algorithm*
BEGIN
  declare a method that takes a single integer as an argument
    SET int_digits = integer split into an array of its composite digits
    IF int_digits is even?
      SET first_half, second_half = partitioned array by / 2
      IF first_half joined to string == second_half joined to string
        PRINT integer
      ELSE
        PRINT integer * 2
    ELSE
      PRINT integer * 2
END
=end

def twice(int)
  int_digits = int.digits.reverse
  num_digits = int_digits.size
  if num_digits.odd?
    return int * 2
  else
    first_half, second_half = int_digits.partition.with_index do |num, idx|
      num if idx < num_digits / 2
    end
    if first_half.join == second_half.join
      return int
    else
      return int * 2
    end
  end
end

# Course Solution - converts number to a string, gets the middle point and
# creates substrings to compare.
# Less if/else logic than mine but also runs unnecessary splits on numbers with
# an odd number of digits.
def twice(number)
  string_number = number.to_s
  center = string_number.size / 2
  left_side = center.zero? ? '' : string_number[0..center - 1]
  right_side = string_number[center..-1]

  return number if left_side == right_side
  return number * 2
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10
