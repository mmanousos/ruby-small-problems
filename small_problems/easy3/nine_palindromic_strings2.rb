=begin
*assignment*
Palindromic Strings (Part 2)
Write another method that returns true if the string passed as an argument is a
palindrome, false otherwise. This time, however, your method should be
case-insensitive, and it should ignore all non-alphanumeric characters. If you
wish, you may simplify things by calling the palindrome? method you wrote in the
previous exercise.

Examples:
real_palindrome?('madam') == true
real_palindrome?('Madam') == true           # (case does not matter)
real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
real_palindrome?('356653') == true
real_palindrome?('356a653') == true
real_palindrome?('123ab321') == false

*problem*
input: string
output: boolean
assessment should check regardless of caplitalization and non-alphanumeric
characters (so disregarding spaces, punctuation, etc.)
Options:
a loop and RegEx to check only the numbers or letters
#delete method to remove all non-alphanumeric characters then check.
convert to an array, use #keep_if method to retain only alphanumeric
  characters then check
convert to an array, #select method to filter out spaces or punctuation then
  check.

*examples / test cases *
see above

*data structures*
strings only

*algorithm*
START
  declare method that takes one string as a parameter
    string.to_a.keep_if(any non-alphanumeric character)
    check string using palindrome? method
    PRINT true / false
  end
END
=end

def palindrome?(value)
  value == value.reverse
end

def real_palindrome?(str)
  palindrome?(str.downcase.chars.keep_if {|char| char =~ /[a-zA-Z0-9]/ })
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false

# Further Exploration
=begin
Read the documentation for String#delete, and the closely related String#count
(you need to read count to get all of the information you need for delete.)

# deletes anything that is a space, comma or apostrophe
def real_palindrome?(str)
  palindrome?(str.downcase.delete(",' "))
end

# deletes anything that isn't a letter or number
def real_palindrome?(str)
  palindrome?(str.downcase.delete("^a-z0-9"))
end
=end
