=begin
*assignment*
Palindromic Strings (Part 1)
Write a method that returns true if the string passed as an argument is a
palindrome, false otherwise. A palindrome reads the same forward and backward.
For this exercise, case matters as does punctuation and spaces.

Examples:
palindrome?('madam') == true
palindrome?('Madam') == false          # (case matters)
palindrome?("madam i'm adam") == false # (all characters matter)
palindrome?('356653') == true

*problem*
input: string
output: true / false
get length of string, divide by 2, loop through from beginning and end of string
checking each character. Break & return false if at any point they do not match.
Otherwise return true.

*examples / test cases *
see above

*data structures*
strings

*algorithm*
START
  declare method that receives string
    SET string_length = string.size
    SET start_counter = 0
    SET midpoint = (string_length / 2).to_i

    WHILE counter <= midpoint
      front_char = string[start_counter]
      end_char = string[string_length]

      IF front_char != end_char
        return false
        break
      end

      front_char += 1
      end_char -= 1

    end

    return true
  end
END
=end

def palindrome?(str)
  str_length = str.size
  start_counter = 0
  midpoint = (str_length / 2).to_i

  while start_counter < midpoint
    front_char = str[start_counter]
    end_char = str[str_length - 1]

    if front_char != end_char
      return false
      break
    end

    start_counter += 1
    str_length -= 1
  end
  true
end

p palindrome?('madam') # == true
p palindrome?('Madam') # == false          # (case matters)
p palindrome?("madam i'm adam") # == false # (all characters matter)
p palindrome?('356653') # == true

# Further Exploration
=begin
Write a method that determines whether an array is palindromic; that is, the
element values appear in the same sequence both forwards and backwards in the
array.
=end

def palindrome_arr?(array)
  array.join == array.reverse.join
end

p palindrome_arr?(%w(a p p l e)) # => false
p palindrome_arr?(%w(1 2 2 1)) # => true
p palindrome_arr?(%w(madam)) # => true
p palindrome_arr?(%w(1 2 3 4)) # => false

=begin
Now write a method that determines whether an array or a string is palindromic;
that is, write a method that can take either an array or a string argument, and
determines whether that argument is a palindrome. You may not use an if, unless,
or case statement or modifier.
=end

# doesn't work for strings (#join is not a valid method)
=begin
def palindrome_arr_or_str?(value)
  value.join == value.reverse.join
end
=end 

def palindrome_arr_or_str?(value)
  value == value.reverse
end

p palindrome_arr_or_str?(%w(a p p l e)) # => false
p palindrome_arr_or_str?(%w(1 2 2 1)) # => true
p palindrome_arr_or_str?("madam i'm adam") # == false # (all characters matter)
p palindrome_arr_or_str?('356653') # == true
