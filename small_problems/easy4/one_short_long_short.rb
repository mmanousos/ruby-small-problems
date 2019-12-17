=begin
*assignment*
Short Long Short
Write a method that takes two strings as arguments, determines the longest of
the two strings, and then returns the result of concatenating the shorter
string, the longer string, and the shorter string once again. You may assume
that the strings are of different lengths.

Examples:
short_long_short('abc', 'defgh') == "abcdefghabc"
short_long_short('abcde', 'fgh') == "fghabcdefgh"
short_long_short('', 'xyz') == "xyz"

*problem*
input: two strings of different lengths
output: one concatenated string with the shortest prepended and apended to the
longer
assume they are of different lengths and are valid strings, not other datatypes
if arg1.size > arg2.size arg2 prepends and apends, otherwise, arg2 wraps arg1.

*examples / test cases *
see above

*data structures*
strings

*algorithm*
START
  declare method that takes two strings as arguments
    IF str1.size > str2.size
      final_str = str2 + str1 + str2
    ELSE
      final_str = str1 + str2 + str1
    end
    PRINT
END
=end

# as if/else
def short_long_short(str1, str2)
  if str1.size > str2.size
    str2 + str1 + str2
  else
    str1 + str2 + str1
  end
end

# as ternary
def short_long_short(str1, str2)
  str1.size > str2.size ? (str2 + str1 + str2) : str1 + str2 + str1
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"
