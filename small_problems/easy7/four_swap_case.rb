=begin
*assignment*
Swap Case
Write a method that takes a string as an argument and returns a new string in
which every uppercase letter is replaced by its lowercase version, and every
lowercase letter by its uppercase version. All other characters should be
unchanged.

You may not use String#swapcase; write your own version of this method.

Example:
swapcase('CamelCase') == 'cAMELcASE'
swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

*problem*
input: string with upper and lowercase letters
output: new string of same characters in same order with cases of letters
inverted, no change to other characters

*examples / test cases *
see above

*data structures*
strings

*algorithm*
BEGIN
  declare a method that takes a single string as an argument
    SET new_string = new empty string to hold output
    WHILE the length of new_string is < length of original string
      examine each character in original string
      IF char == uppercase
        add lowercase version of char to new_string
      ELSEIF char == lowercase
        add uppercase version of char to new_string
      ELSE
        add char to new_string
      end
    PRINT new_string
END
=end

# basic loop
def swapcase(string)
  swapped_string = ''
  counter = 0
  while swapped_string.size < string.size
    if string[counter] =~ /[A-Z]/
      swapped_string << string[counter].downcase
    elsif string[counter] =~ /[a-z]/
      swapped_string << string[counter].upcase
    else
      swapped_string << string[counter]
    end
    counter += 1
  end
  swapped_string
end

# refactored using Array#map - matches Course Solution
def swapcase(string)
  swapped = string.chars.map do |char|
    if char =~ /[A-Z]/
      char.downcase
    elsif char =~ /[a-z]/
      char.upcase
    else
      char
    end
  end
  swapped.join('')
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
