=begin
*assignment*
Double Char (Part 1)
Write a method that takes a string, and returns a new string in which every
character is doubled.

Examples:
repeater('Hello') == "HHeelllloo"
repeater("Good job!") == "GGoooodd  jjoobb!!"
repeater('') == ''

*problem*
input: string
output: string with each character doubled

access each character of the string and put 2 copies of it into an array, join
the array and return it. #each_with_object ?
could this be done by concatenating to a string (without the array)?
empty string returns an empty string (0 * 2 = 0!).


*examples / test cases *
see above

*data structures*
string to array to string

*algorithm*
BEGIN
  declare a method that takes a single string as an argument
    SET arr = [] empty array to hold working values
    SET counter = 0
    WHILE arr.size < string.size * 2
      SET char = each character of the string (start with arr[counter])
      arr << arr[counter] * 2
      increment counter += 1
    PRINT arr.join
END
=end

def repeater(str)
  str.chars.each_with_object([]) { |char, arr| arr << char * 2 }.join
end

def repeater(str)
  doubled_str = ''
  counter = 0
  while counter < str.size
    doubled_str.concat(str[counter] * 2)
    counter += 1
  end
  doubled_str
end

def repeater(str)
  doubled_str = ''
  str.each_char { |char| doubled_str.concat(char * 2) }
  doubled_str
end

# Course Solution - nearly identical to my third solution only using shovel
# operator in place of String#concat method
def repeater(string)
  result = ''
  string.each_char do |char|
    result << char << char
  end
  result
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''
