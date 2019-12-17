=begin
*assignment*
Capitalize Words
Write a method that takes a single String argument and returns a new string that
contains the original value of the argument with the first character of every
word capitalized and all other letters lowercase.

You may assume that words are any sequence of non-blank characters.

Examples
word_cap('four score and seven') == 'Four Score And Seven'
word_cap('the javaScript language') == 'The Javascript Language'
word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

*problem*
input: string with a variety of characters (some capitalized)
output: string with only the first letter of each word capitalized, words within
quotes are exempt from first letter capitalization.

split the string into an array.
capitalize each 0 index character
downcase all other characters
rejoin string using ' ' as a delimiter
return joined string

*examples / test cases *
see above

*data structures*
string to array to string

*algorithm*
BEGIN
  declare method that takes a single string of words as an argument
    SET str_arr = string broken at each space between words
    WHILE there are words remaining to evaluate
      convert word[0].uppercase!
      convert all remaining characters.downcase!
    rejoin array to new string using (' ') as delimiter
    PRINT new string
END
=end

# My Solution - matches Course Solution
def word_cap(string)
  string.split.map { |word| word.capitalize }.join(' ')
end

# More succint Course Solution using symbol shorthand for method - Ruby sugar!
def word_cap(words)
  words.split.map(&:capitalize).join(' ')
end

# Further Exploration
# Ruby convenient provides the String#capitalize method to capitalize strings.
# Without that method, how would you solve this problem? Try to come up with at
# least two solutions.

# Split the string into words, split each word into characters. Capitalize the
# first character and downcase the rest. Rejoin the words, then rejoin the
# string and return.
def word_cap(string)
  new_string = string.split.map do |word|
    characters = word.chars
    characters.each_with_index do |ltr, idx|
      if idx == 0
        ltr.upcase!
      else
        ltr.downcase!
      end
    end
    characters.join('')
  end
  new_string.join(' ')
end

# refactored
def word_cap(string)
  new_string = string.split.map do |word|
    word.chars.each_with_index { |ltr, idx| idx == 0 ? ltr.upcase! : ltr.downcase! }.join('')
  end
  new_string.join(' ')
end

# using String#tr to replace the first letter with a capitalized version
def word_cap(string)
  new_string = string.downcase
  new_arr = new_string.split.each_with_object([]) do |word, arr|
    first = word[0]
    first_cap = word.tr(first, first.upcase)
    arr << first_cap
  end
  new_arr.join(' ')
end

# refactored
def word_cap(string)
  string.downcase.split.each_with_object([]) { |word, arr|
    arr << word.tr(word[0], word[0].upcase)
  }.join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
