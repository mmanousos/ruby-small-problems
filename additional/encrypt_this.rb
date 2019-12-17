# Encrypt this!
#
# You want to create secret messages which can be deciphered by the Decipher
# this! kata. Here are the conditions:
#
# Your message is a string containing space separated words.
# You need to encrypt each word in the message using the following rules:
# The first letter needs to be converted to its ASCII code.
# The second letter needs to be switched with the last letter
# Keepin' it simple: There are no special characters in input.
#
# in: string
# out: new string -
# first letter is its ASCII code
# second and last letters are switched.
#
# AL: split string into array of characters
# map with index
# if index == 0
#   return ord
# elsif index == 1
#   value = string[-1]
# else
#   value
#
# Examples:

def encrypt_this(string)
  words = string.split
  words.map do |word|
    arr = word.chars
    arr[0] = arr[0].ord
    arr[1], arr[-1] = arr[-1], arr[1]
    arr.join
  end.join(' ')
end


p encrypt_this("Hello") == "72olle"
p encrypt_this("good") == "103doo"
p encrypt_this("hello world") == "104olle 119drlo"
