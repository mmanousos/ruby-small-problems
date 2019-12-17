=begin
*assignment*
ASCII String Value
Write a method that determines and returns the ASCII string value of a string
that is passed in as an argument. The ASCII string value is the sum of the ASCII
values of every character in the string. (You may use String#ord to determine
the ASCII value of a character.)

ascii_value('Four score') == 984
ascii_value('Launch School') == 1251
ascii_value('a') == 97
ascii_value('') == 0

*problem*
input: string
output: integer

a string is passed into the method.
each character of the string needs to be evaluated for its ASCII value
and the sum of all of the values should be returned as an integer

*examples / test cases *
see above

*data structures*
string to integer

*algorithm*
START
  declare method that takes a single string as an argument
    SET split_string = array of string broken at each character
    convert each character to its corresponding ASCII value in the array (map)
    reduce the array to a single value (reduce, sum, or inject)
    PRINT the single integer value
END
=end

# with Array#sum - cleanest because Array#sum converts empty array to 0
def ascii_value(str)
  str.split('').map { |ch| ch.ord }.sum
end

# with Array#inject
# first version - doesn't work when there is a nil string
def ascii_value(str)
  str.split('').map { |ch| ch.ord }.inject(:+)
end

# requires a check for a nil string
def ascii_value(str)
  if str.empty?
    0
  else
    str.split('').map { |ch| ch.ord }.inject(:+)
  end
end

# with Array#reduce - requires checking for empty array
def ascii_value(str)
  total = str.split('')
  if total.empty?
    0
  else
    total.map { |ch| ch.ord }.reduce { |sum, num| sum + num }
  end
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

# Further Exploration
=begin
There is an Integer method such that:

char.ord.mystery == char

where mystery is our mystery method. Can you determine what method name should
be used in place of mystery? What happens if you try this with a longer string
instead of a single character?
=end

The 'mystery' method is Int#chr.
This method converts the integer to its corresponding character.
When using it with a string instead of a single character, it only inspects, and
therefore operates on and returns the first character of the string.
