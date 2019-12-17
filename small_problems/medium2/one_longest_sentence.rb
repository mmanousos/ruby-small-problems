=begin
*assignment*
Longest Sentence
Write a program that reads the content of a text file and then prints the
longest sentence in the file based on number of words. Sentences may end with
periods (.), exclamation points (!), or question marks (?). Any sequence of
characters that are not spaces or sentence-ending characters should be treated
as a word. You should also print the number of words in the longest sentence.

Example text:
Four score and seven years ago our fathers brought forth
on this continent a new nation, conceived in liberty, and
dedicated to the proposition that all men are created
equal.

Now we are engaged in a great civil war, testing whether
that nation, or any nation so conceived and so dedicated,
can long endure. We are met on a great battlefield of that
war. We have come to dedicate a portion of that field, as
a final resting place for those who here gave their lives
that that nation might live. It is altogether fitting and
proper that we should do this.

But, in a larger sense, we can not dedicate, we can not
consecrate, we can not hallow this ground. The brave
men, living and dead, who struggled here, have
consecrated it, far above our poor power to add or
detract. The world will little note, nor long remember
what we say here, but it can never forget what they
did here. It is for us the living, rather, to be dedicated
here to the unfinished work which they who fought
here have thus far so nobly advanced. It is rather for
us to be here dedicated to the great task remaining
before us -- that from these honored dead we take
increased devotion to that cause for which they gave
the last full measure of devotion -- that we here highly
resolve that these dead shall not have died in vain
-- that this nation, under God, shall have a new birth
of freedom -- and that government of the people, by
the people, for the people, shall not perish from the
earth.

The longest sentence in the above text is the last sentence; it is 86 words
long. (Note that each -- counts as a word.)

*problem*
input: text string containing sentences ending with periods, exclaimation
points, or question marks
output: longest sentence (string) and the number of words it contains (integer)

access text string
break string into array of sentence substrings based on '.', '?', '!' delimiters
set variable longest to hold which array sentence is the longest based on its
index in the sentence array
access each sentence & break into array of words
set variable to hold size of array of words
loop through to compare size of current array of words to size of previous array words
if the size of the current array of words is > longest
  longest gets reset to current array size
  and loop continues

after loop completes,
puts "The longest sentence in this text is: '#{array[longest].join(' ')}'. It contains #{array[longest].size} words."

words rejoined into string and size of that array.

*examples / test cases *
see above

*data structures*
array

*algorithm*
BEGIN
  require 'yaml'
  declare method that accepts one string (text) as an argument
    SET words = text split into substrings by spaces between characters
    SET sentences = []

    => loop through words. If word ends with . ? or !, push everything before it into a sentences array.

    SET longest = 0
    SET max_words = 0
    SET counter = 0
    WHILE there are still sentences to evaluate (sentences.size > counter)
      sentences[counter].size = max_words
      IF sentences[counter + 1].size > max_words
        max_words = sentences[counter + 1].size
        longest = counter + 1
      end
      counter += 1
    PRINT "The longest sentence in this text is: '#{array[longest].join(' ')}'."
    PRINT "It contains #{array[longest].size} words."
END
=end

speech = File.read('speech.yml')
def longest_sentence(text)
  words = text.split
  sentences = []
  words.each_with_index do |word, idx|
    if word =~ /[.?!]/
      sentences << words.slice!(0..idx).join(' ')
    end
  end
  longest = 0
  max_words = 0

  sentences.each_with_index do |sentence, idx|
    words = sentence.split
    if words.size > max_words
      max_words = words.size
      longest = idx
    end
  end

  puts "The longest sentence in this text is: '#{sentences[longest]}'."
  puts "It contains #{max_words} words."
end

longest_sentence(speech)

# Course Solution
# | separator for RegEx (which I forgot about) to use with String#split
# then Enumerable#max_by which I wasn't familiar with.
text = File.read('sample_text.txt')
sentences = text.split(/\.|\?|!/)
largest_sentence = sentences.max_by { |sentence| sentence.split.size }
largest_sentence = largest_sentence.strip
number_of_words = largest_sentence.split.size

puts "#{largest_sentence}"
puts "Containing #{number_of_words} words"

# Further Exploration
# What about finding the longest paragraph or longest word? How would we go
# about solving that problem?

Could use similar logic.
Longest paragraph would split text by searching for doubled line breaks (new carriage returns), then count all words within each paragraph.
Longest word would simply break using standard String#split method, then count all characters within that word.  
