=begin
*assignment*
Lettercase Percentage Ratio
In the easy exercises, we worked on a problem where we had to count the number
of uppercase and lowercase characters, as well as characters that were neither
of those two. Now we want to go one step further.

Write a method that takes a string, and then returns a hash that contains 3
entries: one represents the percentage of characters in the string that are
lowercase letters, one the percentage of characters that are uppercase letters,
and one the percentage of characters that are neither.

You may assume that the string will always contain at least one character.

Examples:
letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }

*problem*
input: string
output: hash containing keys of lowercase, uppercase, and neither - the values
represent the percentage of each type of character in the original string.

to calculate a percentage, we need the total number of characters in the string
along with the number of each type of character.
divide the character count by the total characters (as a float)
then multiply it by 100

string.size
string.count("^A-z")

*examples / test cases *
see above

*data structures*
string
hash

*algorithm*
BEGIN
  declare a method that accepts one string as an argument
    SET string_size = string.size
    SET percent = {}
    percent[:lowercase] = string.count('a-z') / (string_size * 1.0) * 100
    percent[:uppercase] = string.count('A-Z') / (string_size * 1.0) * 100
    percent[:neither] = string.count('^A-z') / (string_size * 1.0) * 100
END
=end

def letter_percentages(string)
  string_size = string.size
  percent = {}
  percent[:lowercase] = string.count('a-z') / (string_size * 1.0) * 100
  percent[:uppercase] = string.count('A-Z') / (string_size * 1.0) * 100
  percent[:neither] = string.count('^A-z') / (string_size * 1.0) * 100
  percent
end

# Course Solution - more complex but breaks into 2 methods so each only does one
# thing. 
def letter_percentages(string)
  counts = { lowercase: 0, uppercase: 0, neither: 0 }
  percentages = { lowercase: [], uppercase: [], neither: [] }
  characters = string.chars
  length = string.length

  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }

  calculate(percentages, counts, length)

  percentages
end

def calculate(percentages, counts, length)
  percentages[:uppercase] = (counts[:uppercase] / length.to_f) * 100
  percentages[:lowercase] = (counts[:lowercase] / length.to_f) * 100
  percentages[:neither] = (counts[:neither] / length.to_f) * 100
end

p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
