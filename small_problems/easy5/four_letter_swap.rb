=begin
*assignment*
Letter Swap
Given a string of words separated by spaces, write a method that takes this
string of words and returns a string in which the first and last letters of
every word is swapped.

You may assume that every word contains at least one letter, and that the string
will always contain at least one word. You may also assume that each string
contains nothing but words and spaces

Examples:
swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
swap('Abcde') == 'ebcdA'
swap('a') == 'a'

*problem*
input: string of one or more words containing only letters and spaces
output: string of words with same letters, but the first and last letter of each word swapped

break string into an array of separate words to evaluate words individually
if any word is only 1 character long, skip
else for each word break into array of characters
  get first = first character
  get last = last character
  add last to front of array
  add first to end of array
  join array of characters to word
join array of words to string
return string

*examples / test cases *
see above

*data structures*
string to array of arrays to string

*algorithm*
BEGIN
  declare method that takes a single string as an argument
    SET arr = string.split into array of words
    LOOP through each word (swapped_arr = arr.map)
      IF word.size == 1
        skip to next word (word)
      ELSE
        SET chars = word.split into array of characters
        SET first = remove first character (shift)
        SET last = remove last character (pop)
        add last to front of array (unshift)
        add first to end of array (push)
        chars.join (return array of chars to string)
    join arr of swapped words back to string
END


def swap(string)
  string_arr = string.split.map do |word|
    if word.size == 1
      word
    else
      char_arr = word.chars
      first = char_arr.shift
      last = char_arr.pop
      char_arr.unshift(last).push(first)
      char_arr.join('')
    end
  end
  string_arr.join(' ')
end
=end
# Course solution - similar to mine but uses a helper method to swap the letters
# and the helper method uses reassignment to swap the letters
# this spares the need for a conditional to check for single character words
def swap_first_last_characters(word)
  word[0], word[-1] = word[-1], word[0]
  word
end

def swap(words)
  result = words.split.map do |word|
    swap_first_last_characters(word)
  end
  result.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'

# Further Exploration
=begin
How come our solution passes word into the swap_first_last_characters method
invocation instead of just passing the characters that needed to be swapped?
Suppose we had this implementation:

def swap_first_last_characters(a, b)
  a, b = b, a
end

and called the method like this:

swap_first_last_characters(word[0], word[-1])
Would this method work? Why or why not?

# My response
The original version of the course solution uses word as the argument for the
helper method because it is being used within the map method where it is
evaluating each word.
The alternate version would not work because accessing the string values using
String#[] creates new objects which are then reassigned within the helper
method. But they are not affected within the original method.
=end
