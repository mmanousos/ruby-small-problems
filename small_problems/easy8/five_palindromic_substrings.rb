=begin
*assignment*
Palindromic Substrings
Write a method that returns a list of all substrings of a string that are
palindromic. That is, each substring must consist of the same sequence of
characters forwards as it does backwards. The return value should be arranged in
the same sequence as the substrings appear in the string. Duplicate palindromes
should be included multiple times.

You may (and should) use the substrings method you wrote in the previous
exercise.

For the purposes of this exercise, you should consider all characters and pay
attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor
"Abc-bA" are. In addition, assume that single characters are not palindromes.

Examples:
palindromes('abcd') == []
palindromes('madam') == ['madam', 'ada']
palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

*problem*
input: string
output: array containing all palindromic substrings within the string, including
repeats if the palindrome occurs more than once, sorted by the position that
the palindrome occurs in the string.

Rules:
single characters are not palindromes
capital and lowercase letters are not identical for matching purposes
spaces and non-letter characters must be considered in matches

using substrings method, substrings will already be sorted appropriately.
then, examine each substring generated to assess for palindromic compliance
(discard all substrings with < 2 characters)
using Array#select


*examples / test cases *
see above

*data structures*
string to array of substrings

*algorithm*
BEGIN
  declare method that takes a single string as an argument
    SET palindromes = [] empty array to hold palindromes
    SET all_subs = return value of substrings method with string as the argument
    SET counter = 0
    WHILE all_subs.size > counter
      IF substring.size > 1
        front_counter = 0
        rear_counter = -1
        WHILE substring[front_counter] == substring[rear_counter]
          front_counter += 1
          rear_counter -= 1
        substring
      ELSE
        next
      END
      increment counter += 1
    PRINT palindromes
END
=end

def substrings_at_start(string)
  return_array = []
  counter = 0
  while counter < string.size
    return_array << string.slice(0..counter)
    counter += 1
  end
  return_array
end

def substrings(string)
  all_substrings = []
  counter = 0
  while counter < string.size
    substring = string.slice(counter..(string.size - 1))
    all_substrings << substrings_arr = substrings_at_start(substring)
    counter += 1
  end
  all_substrings.flatten
end

def palindromes(str)
  substrings(str).select { |sub| sub.size > 1 && sub == sub.reverse }
end

# Course Solution - similar logic to my solution, checking if each substring is
# a palindrome, but they used a helper method for what I did within the block
# used with Array#select
def palindromes(string)
  all_substrings = substrings(string)
  results = []
  all_substrings.each do |substring|
    results << substring if palindrome?(substring)
  end
  results
end

def palindrome?(string)
  string == string.reverse && string.size > 1
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

# Further Exploration
# Can you modify this method (and/or its predecessors) to ignore
# non-alphanumeric characters and case?

def palindromes_all_letters(str)
  substrings(str).select do |sub|
    alt_sub = sub.downcase
    alt_sub = alt_sub.chars.select { |char| char =~ /[a-z]/ }.join
    alt_sub.size > 1 && alt_sub == alt_sub.reverse
  end
end

p palindromes_all_letters('AbcbA') == ['AbcbA', 'bcb']
p palindromes_all_letters('Abcba') == ['Abcba', 'bcb']
p palindromes_all_letters('Abc-bA') == ['Abc-bA', 'bc-b']
p palindromes_all_letters('hello-madam-did-madam-goodbye') == [
  "ll", "-madam-", "-madam-did-madam-", "madam", "madam-did-madam", "ada",
  "adam-did-mada", "dam-did-mad", "am-did-ma", "m-did-m", "-did-", "did",
  "-madam-", "madam", "ada", "oo"
]
