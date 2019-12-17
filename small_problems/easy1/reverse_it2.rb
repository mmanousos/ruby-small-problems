=begin
*assignment*
Reverse It (Part 2)
Write a method that takes one argument, a string containing one or more words,
and returns the given string with all five or more letter words reversed.
Each string will consist of only letters and spaces. Spaces should be included
only when more than one word is present.

Examples:
  puts reverse_words('Professional')          # => lanoisseforP
  puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
  puts reverse_words('Launch School')         # => hcnuaL loohcS

*problem*
  input: string of one or more words
  output: string with each word that is >= 5 characters reversed
  trim any extra spaces if there is only one word in the original string
  (is this necessary?)
  per provided examples, case remains as provided.
  assume no error message needed for empty strings.

*examples / tests*
see above

*data structures*
  input: string, converted to array
  output: string

*algorithm*
  reverse_words method receives string as argument.
  (should it check if the string is only one word first?)
  create new empty array to hold newly altered phrase
  split string into array (can this be done in place?)
  loop through array to check if each word is 5 or more letters.
  if yes, reverse word and add to new array
  if no, add original word to new array
  join array into new string and return

=end

# with new array
def reverse_words(string)
  flipped_words = []
  string.split.each { |word|
    if word.length >= 5
      word.reverse!
      flipped_words << word
    else
      flipped_words << word
    end
  }
  flipped_words.join(' ')
end

=begin
# shorter based on ruby syntax shown in course solution 
def reverse_words(string)
  flipped_words = []
  string.split.each { |word|
    word.reverse! if word.length >= 5
    flipped_words << word
  }
  flipped_words.join(' ')
end
=end

=begin
# flipping in place
def reverse_words(string)
  array = string.split.each { |word|
    if word.length >= 5
      word.reverse!
    else
      next
    end
  }
  array.join(' ')
end
=end

#check if more than 1 word present
# only split string if there is a space in the string (use RegEx)
=begin
def reverse_words(string)
  if string =~ /\s/
    array = string.split.each { |word|
      if word.length >= 5
        word.reverse!
      else
        next
      end
    }
    array.join(' ')
  else
    if string.length >= 5
      string.reverse
    end
  end
end
=end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
