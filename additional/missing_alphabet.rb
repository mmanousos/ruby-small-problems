# Missing Alphabet
# In this Kata you have to create a function,named insert_missing_letters,that takes in a string and outputs the same string processed in a particular way.
#
# The function should insert only after the first occurence of each character of the input string, all the alphabet letters that:
#
# -are NOT in the original string
# -come after the letter of the string you are processing
#
# Each added letter should be in uppercase, the letters of the original string will always be in lowercase.
#
# Example:
# input: "holly"
# missing letters: "a,b,c,d,e,f,g,i,j,k,m,n,p,q,r,s,t,u,v,w,x,z"
# output: "hIJKMNPQRSTUVWXZoPQRSTUVWXZlMNPQRSTUVWXZlyZ"
#
# You do not need to validate input, the input string will always contain a certain amount of lowercase letters (min 1 / max 50).
# https://www.codewars.com/kata/missing-alphabet
#
# in: string (always downcase)
# out: new string with uppercase letters inserted after each letter of the original string.
# uppercase letters should be the range of letters of the alphabet not included in the original string & only those of that range that occur after the original string letter they follow.
#
# AL: split the string into an array
# iterate over the string array to create the range of uppercase letters that are not included in the original string
# iterate through the original string appending the range, starting at the current letter, to that letter.
# join the array back to a string and return.

ALPHABET = [*'A'..'Z']

def insert_missing_letters(st)
  missing_letters = ALPHABET.reject {|ltr| st.include?(ltr.downcase) }
  added_ltrs = []

  st.each_char do |chr|
    added_ltrs << chr
    char_index = ALPHABET.index(chr.upcase)
    missing_range = missing_letters[missing_letters.index(ALPHABET[char_index+1])..-1].join
    added_ltrs << missing_range unless added_ltrs[-2] == missing_range
  end

  added_ltrs.join
end

p insert_missing_letters("holly") == "hIJKMNPQRSTUVWXZoPQRSTUVWXZlMNPQRSTUVWXZlyZ"
# missing letters: "a,b,c,d,e,f,g,i,j,k,m,n,p,q,r,s,t,u,v,w,x,z"
# output: "hIJKMNPQRSTUVWXZoPQRSTUVWXZlMNPQRSTUVWXZlyZ"
p insert_missing_letters("hello") == "hIJKMNPQRSTUVWXYZeFGIJKMNPQRSTUVWXYZlMNPQRSTUVWXYZloPQRSTUVWXYZ"

# Yes, I'm sure. My code runs on my system. I wrote it in my code editor then copied and pasted here. It is only 15 lines long, and includes all necessary closing `end` commands. So I'm not sure why they would register an error on line 20. 
