=begin
*assignment*
Get The Middle Character
Write a method that takes a non-empty string argument, and returns the middle
character or characters of the argument. If the argument has an odd length, you
should return exactly one character. If the argument has an even length, you
should return exactly two characters.

Examples:
center_of('I love ruby') == 'e'
center_of('Launch School') == ' '
center_of('Launch') == 'un'
center_of('Launchschool') == 'hs'
center_of('x') == 'x'

*problem*
input: string
output: middle one or two characters if the string length is odd or even respectively

count size of string
if size is odd, divide by two and get the character at that index
if size is even, divide by two, get the character at that index and index - 1

*examples / test cases *
see above

*data structures*
strings

*algorithm*
BEGIN
  declare a method that takes a single string as an argument
    SET str_length = size of string
    SET middle = str_length / 2
    IF str_length is odd
      PRINT str[middle]
    ELSE
      PRINT str[middle -1..middle]
    end
  end
END
=end

def center_of(str)
  str_length = str.size
  middle = str_length / 2
  if str_length.odd?
    return str[middle]
  else
    return str[middle-1..middle]
  end
end

# Course Solution - similar logic to my solution. Shows explicit return commands
# and declaring a variable for string.size are unnecessary. 
def center_of(string)
  center_index = string.size / 2
  if string.size.odd?
    string[center_index]
  else
    string[center_index - 1, 2]
  end
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
