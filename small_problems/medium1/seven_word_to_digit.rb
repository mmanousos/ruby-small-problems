=begin
*assignment*
Word to Digit
Write a method that takes a sentence string as input, and returns the same
string with any sequence of the words 'zero', 'one', 'two', 'three', 'four',
'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

Example:
word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

*problem*
input: string of words
output: string of words with any words representing numbers converted to their
corresponding digits, still separated by spaces.

use array as a constant
map words to their corresponding digits

*examples / test cases *
see above

*data structures*
array

*algorithm*
BEGIN
  SET a constant = array holding strings to convert
  declare a method that takes a single string as an argument
    SET str_arr = string broken into array of words
      SET new_arr = WHILE there are words remaining to be evaluated
        IF word is present in constant
          map index value of word in constant array into new array
      end
      return new_arr joined back to string
END
=end

NUMBERS = %w(zero one two three four five six seven eight nine)

# almost works fully.
def word_to_digit(phrase)
  phrase.split.map do |word|
    no_extra = word.downcase.gsub(/[^a-z]/, '') # strips punctuation to check but then punctuation is missing from final string
    NUMBERS.include?(no_extra) ? NUMBERS.index(no_extra) : word
  end.join(' ')
end

# Can't be the easiest solution for this problem.
# if word ends with punctuation, save punctuation into its own variable and append to mapped value
def word_to_digit(phrase)
  phrase.split.map do |word|
    if word =~ /[^a-z]/i
      punctuation = word.slice(/[^a-z]/i)
      no_extra = word.chop
      if NUMBERS.include?(no_extra)
        NUMBERS.index(no_extra).to_s + punctuation
      else
        word
      end
    elsif NUMBERS.include?(word)
      NUMBERS.index(word)
    else
      word
    end
  end.join(' ')
end

# Course Solution - uses a hash to store the conversion values, which I
# considered doing but the array seemed more straight forward since I was
# mapping to digits that are the same as the number. But storing them as string
# representations of the numbers allows for use of String#gsub, which works
# around punctuation.
# wrapping \b around the phrase to be searched for in RegEx is a functionality
# I'm less familiar with so I don't know that I would have known to go with this
# logic
DIGIT_HASH = {
  'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4',
  'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9'
}.freeze

def word_to_digit(words)
  DIGIT_HASH.keys.each do |word|
    words.gsub!(/\b#{word}\b/, DIGIT_HASH[word])
  end
  words
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
