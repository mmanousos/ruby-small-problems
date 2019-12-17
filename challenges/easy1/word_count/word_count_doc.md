Write a program that given a phrase can count the occurrences of each word in that phrase.

For example, if we count the words for the input "olly olly in come free", we should get:

olly: 2
in: 1
come: 1
free: 1

Problem
string input
count each word
return an hash with the words and how many times they occur in the string

strip external punctuation but retain inner apostrophes for contractions
words do not need to be in alphabetical order.

Edge cases:
empty string - return empty hash?

Example / Tests
in: "olly olly in come free"
out:
{ "olly" => 2, "in" 1, "come" => 1, "free" => 1 }

Data Structure
string to array to hash

Algorithm
BEGIN
given string input
SET results as empty hash
string = string remove all outer punctuation & downcase
SET string_words = array of words
iterate over string_words
IF hash already has a key with that word
  += 1 to value
ELSE
  hash[word] = 1
READ string
END
