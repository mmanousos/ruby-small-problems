=begin
*assignment*
Convert number to reversed array of digits
Write a method that takes a positive integer as an argument and returns that
number with its digits reversed.

Examples:
reversed_number(12345) == 54321
reversed_number(12213) == 31221
reversed_number(456) == 654
reversed_number(12000) == 21 # Note that zeros get dropped!
reversed_number(1) == 1

*problem*
input: integer
output: integer with digits in reversed order from integer (trailing zeros not included)


*examples / test cases *
see above

*data structures*
integers

*algorithm*
BEGIN
  declare a method that takes a single integer as a method
    arr = integer split into composite digits
    PRINT reverse array (already happens with Integer#digits), join to string, coerce to integer
END
=end 

def reversed_number(int)
  int.digits.join.to_i
end

# Course Solution - similar logic to my solution, but they convert the integer
# to a string instead of an array.
# Both datatypes can be reversed and then changed back into integers for return.
def reversed_number(number)
  string = number.to_s
  reversed_string = string.reverse
  reversed_string.to_i
end

# course solution could also be simplified to a single line
def reversed_number(number)
  number.to_s.reverse.to_i
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # Note that zeros get dropped!
p reversed_number(1) == 1
