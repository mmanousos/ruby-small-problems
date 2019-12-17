# Mumbling
# This time no story, no theory. The examples below show you how to write function accum:
# The parameter of accum is a string which includes only letters from a..z and A..Z.

# in: string
# output: string
# original characters from the argument string
# each character repeated the number of times corresponding to the position of the character in the original string
# first character of each set is capitalized
# each set of character is separated by a dash '-'

# # AL: break the string into characters in an array
# iterate over that new array of characters
# map characters to 2nd new array: based on their index in the array (x), repeat that character in the resulting array x+1 times
# iterate over 2nd new array, capitalizing the first letter
# join 2nd new array to string using '-' delimiter
# return new string

def accum(str)
  new_arr = str.chars.map.with_index(1) do |char, idx|
    new_str = ''
    idx.times { new_str += char }
    new_str
  end
  new_arr.map { |el| el.capitalize }.join('-')
end

p accum("abcd")    == "A-Bb-Ccc-Dddd"
p accum("RqaEzty") == "R-Qq-Aaa-Eeee-Zzzzz-Tttttt-Yyyyyyy"
p accum("cwAt")    == "C-Ww-Aaa-Tttt"
