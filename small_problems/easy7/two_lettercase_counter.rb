=begin
*assignment*
Lettercase Counter
Write a method that takes a string, and then returns a hash that contains 3
entries: one represents the number of characters in the string that are
lowercase letters, one the number of characters that are uppercase letters, and
one the number of characters that are neither.

Examples
letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

*problem*
input: string
output: hash with three key-value pairs - lowercase, uppercase, neither

count each type of character
create a new hash with the keys to hold the results, even if the string is empty


*examples / test cases *
see above

*data structures*
string to hash containing integers as the values of the key-value pairs

*algorithm*
BEGIN
  declare method that takes one string as an argument
    SET hash = { lowercase: 0, uppercase: 0, neither: 0 }
    SET str_arr = string split into array by character
    SET counter = 0
    WHILE there are elements left in the array to assess (counter < str_arr.size)
      (check if each element is uppercase, lowercase or neither)
      IF 'a-z'.include?(el)
        increment hash[:lowercase] += 1
      ELSEIF 'A-Z'.include?(el)
        increment hash[:uppercase] += 1
      ELSE
        increment hash[:neither] += 1
      end
      counter += 1
    end
    PRINT hash
END
=end

# basic loop
def letter_case_count(string)
  hash = { lowercase: 0, uppercase: 0, neither: 0 }
  str_arr = string.chars
  counter = 0
  while counter < str_arr.size
    if ('a'..'z').include?(str_arr[counter])
      hash[:lowercase] += 1
    elsif ('A'..'Z').include?(str_arr[counter])
      hash[:uppercase] += 1
    else
      hash[:neither] += 1
    end
    counter += 1
  end
  hash
end

# basic loop checking values using RegEx
def letter_case_count(string)
  hash = { lowercase: 0, uppercase: 0, neither: 0 }
  str_arr = string.chars
  counter = 0
  while counter < str_arr.size
    if str_arr[counter] =~ /[a-z]/
      hash[:lowercase] += 1
    elsif str_arr[counter] =~ /[A-Z]/
      hash[:uppercase] += 1
    else
      hash[:neither] += 1
    end
    counter += 1
  end
  hash
end

# Array#each method + RegEx
def letter_case_count(string)
  hash = { lowercase: 0, uppercase: 0, neither: 0 }
  str_arr = string.chars
  str_arr.each do |char|
    if char =~ /[a-z]/
      hash[:lowercase] += 1
    elsif char =~ /[A-Z]/
      hash[:uppercase] += 1
    else
      hash[:neither] += 1
    end
  end
  hash
end

# Course Solution - using Enumerable#count and RegEx, this solution loops
# through the created character array three times checking the case or otherness
# of each character and assigning the quantity of matches to the appropriate key
def letter_case_count(string)
  counts = {}
  characters = string.chars
  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }
  counts
end


p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
