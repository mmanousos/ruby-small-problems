# Word to Digit
# Write a method that takes a sentence string as input, and returns the same string with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

# Example:

# in: string
# out: new string with same contents but any english numbers converted to integers

# AL: split the string into discreet words
# iterate over, converting string numbers to integers based on constant (either array or hash)
# rejoin string and return. pay attention to punctuation.

revised AL: iterate over NUMBERS constant, replacing any instances of the key (number word) with the value (integer as a string). return the replaced string.


NUMBERS = { "zero" => "0",
            "one" => "1",
            "two" => "2",
            "three" => "3",
            "four" => "4",
            "five" => "5",
            "six" => "6",
            "seven" => "7",
            "eight" => "8",
            "nine" => "9" }


def word_to_digit(str)
  NUMBERS.each_pair { |word, num| str.gsub!(word, num) }
  str
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
