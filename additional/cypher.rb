# Digital Cypher
# Introduction
# Digital Cypher assigns to each letter of the alphabet unique number. For example:
#
#  a  b  c  d  e  f  g  h  i  j  k  l  m
#  1  2  3  4  5  6  7  8  9 10 11 12 13
#  n  o  p  q  r  s  t  u  v  w  x  y  z
# 14 15 16 17 18 19 20 21 22 23 24 25 26
# Instead of letters in encrypted word we write the corresponding number, eg. The word scout:
#
#  s  c  o  u  t
# 19  3 15 21 20
# Then we add to each obtained digit consecutive digits from the key. For example. In case of key equal to 1939 :
#
#    s  c  o  u  t
#   19  3 15 21 20
#  + 1  9  3  9  1
#  ---------------
#   20 12 18 30 21
#
#    m  a  s  t  e  r  p  i  e  c  e
#   13  1 19 20  5 18 16  9  5  3  5
# +  1  9  3  9  1  9  3  9  1  9  3
#   --------------------------------
#   14 10 22 29  6 27 19 18  6  12 8
#
# Task
# Write a function that accepts str string and key number and returns an array of integers representing encoded str.
#
# Input / Output
# The str input string consists of lowercase characters only.
# The key input number is a positive integer.
#
# Example
# Encode("scout",1939);  ==>  [ 20, 12, 18, 30, 21]
# Encode("masterpiece",1939);  ==>  [ 14, 10, 22, 29, 6, 27, 19, 18, 6, 12, 8]
#
# in: string of lowercase letters (string) and an integer (key)
# out: array of integers representing encoded string
#
# AL:
# assign each letter in the string to its numerical equivalent in the alphabet
# constant array with the alphabet letters
# use map to convert the letters of the string to the array index of the corresponding letter + 1
# new array will contain all the alphabetic numeric equivalent
#
# get the number of digits in the key integer
# # break the string into substrings of that length
# loop through the digits of the key integer and
# cypher array = loop through the new array mapping the alphabetic number + current digit
#
# return  cypher array

ALPHABET = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)

# straight forward
def encode(message, key)
  alpha_num = message.chars.map { |char| ALPHABET.index(char) + 1 }

  key_digits = key.digits.reverse
  key_num = key_digits.size

  counter = 0
  cypher_arr = []

  alpha_num.each do |el|
    cypher_arr << el + key_digits[counter]
    counter += 1
    counter = 0 unless counter < key_num
  end

 cypher_arr
end

# slightly shorter, but more complex
def encode(message, key)
  alpha_num = message.chars.map { |char| ALPHABET.index(char) + 1 }

  key_digits = key.digits.reverse
  key_num = key_digits.size

  counter = -1

  cypher_arr = alpha_num.map do |el|
    counter = -1 unless counter < key_num - 1
    counter += 1
    el + key_digits[counter]
  end

end

p encode("scout",1939) == [ 20, 12, 18, 30, 21]
p encode("masterpiece",1939) == [ 14, 10, 22, 29, 6, 27, 19, 18, 6, 12, 8]
