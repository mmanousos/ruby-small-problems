=begin
*assignment*
Counting the Number of Characters
Write a program that will ask a user for an input of a word or multiple words
and give back the number of characters. Spaces should not be counted as a
character.

input: Please write word or multiple words: walk
output: There are 4 characters in "walk".
input: Please write word or multiple words: walk, don't run
output: There are 13 characters in "walk, don't run".

*problem*
input: string
output: string including number of non-space characters in the entered string
Assume input is a valid string (not some other data type).

*examples / test cases *
see above

*data structures*

*algorithm*
START
  PUT 'Please write a word or multiple words:'
  GET and SET phrase
  SET num_chars: options
    - split string based on spaces, rejoin without spaces and count characters
    - use #delete method then count characters

    can use #length or #size to count.
    - could also #count # of spaces, then deduct spaces from total count & return
    that value.
    - or #count only letters and valid punctuation
  PRINT "There are " + num_chars + " characters in  '" + phrase + "'."

END
=end

puts 'Please write a word or multiple words:'
phrase = gets.chomp
num_chars = phrase.split.join().length
# num_chars = phrase.delete(' ').size
# num_chars = phrase.count(phrase) - phrase.count(' ')
# num_chars = phrase.count('a-zA-Z.,/#!$%^&*;:{}=\-_`~()')

puts 'There are ' + num_chars.to_s + " characters in '" + phrase + "'."
