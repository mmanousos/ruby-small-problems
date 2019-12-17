=begin
*assignment*
Letter Counter (Part 2)
Modify the word_sizes method from the previous exercise to exclude non-letters
when determining word size. For instance, the length of "it's" is 3, not 4.

Examples
word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
word_sizes('') == {}

*problem*
input: string of words (letters and punctuation) divided by spaces
output: hash with keys of word length (letters minus punctuation) and values
equal to number of words of each length are in the string

empty strings need to generate a new hash

*examples / test cases *
see above

*data structures*
string to hash

*algorithm*
BEGIN
  declare method that takes one string as an argument
    SET hash = empty hash to hold return value
    SET words_array = string split into array of substrings by spaces
    WHILE word elements remain in words_array to evaluate
      SET characters_array = word element split into characters
      WHILE there are characters in the word left to evaluate
        IF character is a letter
          keep it
        ELSE
          reject it
        count the remaining characters
    IF the hash has a key equivalent to the count of characters
      increment the value by += 1
    ELSE
      create a key equivalent to the count of characters = 1
    PRINT hash
END
=end

# use Array#keep_if to evaluate each character of the individual words, only
# keep letters (alt.: could use Ennumerable#reject and specify the punctuation)
def word_sizes(string)
  string.split.each_with_object({}) do |word, hsh|
    word = word.chars.keep_if { |ch| ('A'..'z').include?(ch) }.join('')
    len = word.length
    hsh[len] != nil ? hsh[len] += 1 : hsh[len] = 1
  end
end

# Course Solution
# Similar to my solution but uses mutating method #delete instead of #keep_if
def word_sizes(words_string)
  counts = Hash.new(0)
  words_string.split.each do |word|
    clean_word = word.delete('^A-Za-z')
    counts[clean_word.size] += 1
  end
  counts
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}
