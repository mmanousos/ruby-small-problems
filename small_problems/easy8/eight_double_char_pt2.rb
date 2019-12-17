=begin
*assignment*
Double Char (Part 2)
Write a method that takes a string, and returns a new string in which every
consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and
whitespace should not be doubled.

Examples:
double_consonants('String') == "SSttrrinngg"
double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
double_consonants("July 4th") == "JJullyy 4tthh"
double_consonants('') == ""

*problem*
input: string
output: string with only consonants doubled
vowels, whitespace, and other special characters should be added once only

use RegEx to check which characters meet this qualification
if /[a-z]/i && /[^aeiou]/i
  * 2
else
  * 1

*examples / test cases *
see above

*data structures*
strings

*algorithm*
BEGIN
  declare a method that takes a single string as an argument
    SET counter = 0
    SET return = ''
    WHILE counter < string.size
      IF string[counter] is a letter but not a vowel
        add string[counter] * 2 to return string
      ELSE
        add string[counter] to return string
      end
      increment counter += 1
    end
    PRINT return
END
=end

def double_consonants(str)
  return_str = ''
  str.each_char do |char|
    if char =~ /[a-z]/i && char =~ /[^aeiou]/i
      return_str.concat(char * 2)
    else
      return_str << char
    end
  end
  return_str
end

# Course Solution - uses a constant to define consonants
# adds character to string twice if it is included in the array of consonants
CONSONANTS = %w(b c d f g h j k l m n p q r s t v w x y z)

def double_consonants(string)
  result = ''
  string.each_char do |char|
    result << char
    result << char if CONSONANTS.include?(char.downcase)
  end
  result
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""
