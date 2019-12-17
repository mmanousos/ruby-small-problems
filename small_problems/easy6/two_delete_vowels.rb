=begin
*assignment*
Delete vowels
Write a method that takes an array of strings, and returns an array of the same
string values, except with the vowels (a, e, i, o, u) removed.

Example:
remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

*problem*
input: array of one or more strings
output: array of same length of strings with vowels removed

need to check for both uppercase and lowercase values
account for empty string
assume array will contain at least one string.

*examples / test cases *
see above

*data structures*
array of strings for input and output

*algorithm*
BEGIN
  declare method that accepts a single array of strings as a method
    SET str = string argument value
    WHILE there are strings remaining in array to evaluate
      check each string for vowels
      remove existing vowels
    PRINT array of strings with vowels removed
END
=end

def remove_vowels(string_array)
  string_array.map { |string| string.delete('AEIOUaeiou') }
end

# Further Exploration
=begin
Ruby has all sorts of String methods that could accomplish this task. How did
you end up solving this exercise?
=end

#using global substitution and RegEx
def remove_vowels(string_array)
  string_array.map {|word| word.gsub(/[aeiouAEIOU]/, '')}
end

# RegEx ignoring case
def remove_vowels(string_array)
  string_array.map {|word| word.gsub(/[aeiou]/i, '')}
end

# String.scan pulls apart the characters, checks them for truthyness and puts
# truthy values into an array, then need Array#join to return a string
# RegEx returns only non-vowel characters
def remove_vowels(words)
  words.map { |word| word.scan(/[^aeiouAEIOU]/).join }
end

def remove_vowels(words)
  words.map { |word| word.scan(/[^aeiou]/i).join }
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) # == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) # == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) # == ['BC', '', 'XYZ']
