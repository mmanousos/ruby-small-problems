=begin
*assignment*
Leading Substrings
Write a method that returns a list of all substrings of a string that start at
the beginning of the original string. The return value should be arranged in
order from shortest to longest substring.

Examples:
substrings_at_start('abc') == ['a', 'ab', 'abc']
substrings_at_start('a') == ['a']
substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

*problem*
input: string
output: array of strings composed of each possible substring from the original
string, arranged by ascending length
(only cropped strings, not combinations of letters)

Assume no empty strings are provided.

*examples / test cases *
see above

*data structures*
string to array of strings

*algorithm*
BEGIN
  declare a method that takes a single string as an argument
    SET return_array = empty array to hold return value
    SET counter = 0
    WHILE there are letters remaining in the string to be examined (counter < string.size or return_array.size < string.size)
      split string into substring using range 0..counter
      push substring into return_array
      increment counter += 1
    PRINT return_array
END
=end

# using basic loop and String#slice
def substrings_at_start(string)
  return_array = []
  counter = 0
  while counter < string.size
    return_array << string.slice(0..counter)
    counter += 1
  end
  return_array
end

# Course Solution - The same logic as my solution but uses Integer#upto method
# prevents need for a counter and doesn't risk infinite loop.
def substrings_at_start(string)
  result = []
  0.upto(string.size - 1) do |index|
    result << string[0..index]
  end
  result
end

# I appreciated this student solution that uses Array#map. I knew it could
# likely be done using that method but wasn't really clear how to implement it.
def substrings_at_start(string)
  string.chars.map.with_index do |_, idx|
    string[0..idx]
  end
end

# I would further reduce it to one line this way:
def substrings_at_start(string)
  string.chars.map.with_index { |_, idx| string[0..idx] }
end

p substrings_at_start('abc') == ['a', 'ab', 'abc']
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
