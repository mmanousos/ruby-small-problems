Anagrams
Write a program that, given a word and a list of possible anagrams, selects the correct sublist that contains the anagrams of the word.

For example, given the word "listen" and a list of candidates like "enlists" "google" "inlets" "banana" the program should return a list containing "inlets". Please read the test suite for exact rules of anagrams.

Problem
argument is a word plus a list of other words
program should analyze the other words against our given word to check for anagrams and return a list that only contains the matching anagrams.

Example / Tests
return empty array if the word or list do not contain letters

anagrams must be the same length
  so we can rule out any strings in the list of more or fewer characters than our given word

We should ignore case of the letters in the word and those in the list.

words that are exact matches for the word do not count - only those with the same letters but in a different order.

Data Structure
string and array of strings to check against
return an array


Algorithm
BEGIN
initial argument is a single string
SET word = string argument
second argument is an array of strings

break clause to check if word or array contain non-letter values
  return ArgumentError if they do

iterate over array to check for matches
  SET word_sorted = word downcase, broken into characters, then sorted
  compare word_sorted to each element of array sorted in the same way
  if they are == add them to array to return
END
