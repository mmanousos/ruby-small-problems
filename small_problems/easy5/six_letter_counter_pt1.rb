=begin
*assignment*
Letter Counter (Part 1)
Write a method that takes a string with one or more space separated words and
returns a hash that shows the number of words of different sizes.

Words consist of any string of characters that do not include a space.

Examples
word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
word_sizes('') == {}

*problem*
input: string of words (letters and punctuation) separated by spaces
output: hash of the corresponding substring (word) lengths as keys and number of
words of that length as the values

empty strings need to create an empty hash.

break string into array of substrings
evaluate the length of each substring
if a key for that length already exists, increment its value by 1
else create a key for that length and set its value to 1
return the hash

*examples / test cases *
see above

*data structures*
string to hash

*algorithm*
BEGIN
  declare method that takes one string as an argument
    SET hash = empty hash to hold results
    SET array = string broken at spaces
    WHILE array has elements to evaluate
      SET length = size of substring element
      IF hash has key of length
        increment value by += 1
      ELSE
        create key of length and set value to 1
    PRINT hash
END
=end

# using Ennumerable#each_with_object to create a hash while iterating over array
# created by splitting string
def word_sizes(string)
  string.split.each_with_object({}) do |word, hsh|
    len = word.length
    hsh[len] != nil ? hsh[len] += 1 : hsh[len] = 1
  end
end

# Course solution
# very similar in execution except it initializes the hash with default value of
# 0 instead of creating the hash only once values were evaluated
def word_sizes(words_string)
  counts = Hash.new(0)
  words_string.split.each do |word|
    counts[word.size] += 1
  end
  counts
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}

# Further Exploration
=begin
Take some time to read about Hash::new to learn about the different ways to
initialize a hash with default values.
=end
https://ruby-doc.org/core-2.4.1/Hash.html#method-c-new

Can set the default value directly as an argument to the ::new method.
e.g.
hash1 = Hash.new('Super duper')
hash1[:a] # => 'Super duper'

Or can set the default value using a block to pass it in for each created key.
e.g.
hash2 = Hash.new { |hash, key| hash[key] = 'Far out' }
hash2[:a] # => 'Far out'

In either form, if the key is assigned a value, that value overwrites the
default.
Using the second form, the key can be interpolated into the value.
This is not possible in the first form.
e.g.
hash3 = Hash.new { |hash, key| hash[key] = "So cool: #{key}" }
hash3[:a] # => 'So Cool: a' 
