# Lettercase Percentage Ratio
# In the easy exercises, we worked on a problem where we had to count the number of uppercase and lowercase characters, as well as characters that were neither of those two. Now we want to go one step further.

# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of characters in the string that are lowercase letters, one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.

# You may assume that the string will always contain at least one character.

# in: string
# out: 3 element hash with percentages of lowercase, uppercase, neither characters in the string.
# AL: SET array with keys for lc, uc, neither.
#   count each type of character in string / str.length
#   assign values in hash
#   return hash

def letter_percentages(str)
  hash = { "lowercase" => 0, "uppercase" => 0, "neither" => 0 }
  leng = str.size
  hash["lowercase"] = (str.count('a-z').fdiv(leng)) * 100
  hash["uppercase"] = (str.count('A-Z').fdiv(leng)) * 100
  hash["neither"] = (str.count('^a-zA-Z').fdiv(leng)) * 100

  hash
end


p letter_percentages('abCdef 123') # == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') # == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') # == { lowercase: 0, uppercase: 0, neither: 100 }
