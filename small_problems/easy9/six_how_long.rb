=begin
*assignment*
How long are you?
Write a method that takes a string as an argument, and returns an Array that
contains every word from the string, to which you have appended a space and the
word length.

You may assume that words in the string are separated by exactly one space, and
that any substring of non-space characters is a word.

Examples:
word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

word_lengths("") == []

*problem*
input: string
output: array containing strings of each word and its length separated by a space

*examples / test cases *
see above

*data structures*
string to array

*algorithm*
BEGIN
  declare a method that accepts one string as an argument
    SET arr = string broken into array of substrings by spaces
    SET counter = 0
    WHILE elements remain in array to assess
      SET el = arr[counter]
      SET count = number of characters in el
      append " " + count to el
    return arr
END
=end

def word_lengths(str)
  arr = str.split
  arr.each { |word| word << " #{word.length}" }
  arr
end

# Course Solution - same concept but simplified by using Enumerable#map
def word_lengths(string)
  string.split.map { |word| "#{word} #{word.length}" }
end

p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []
