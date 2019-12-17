=begin
*assignment*
Uppercase Check
Write a method that takes a string argument, and returns true if all of the
alphabetic characters inside the string are uppercase, false otherwise.
Characters that are not alphabetic should be ignored.

Examples:
uppercase?('t') == false
uppercase?('T') == true
uppercase?('Four Score') == false
uppercase?('FOUR SCORE') == true
uppercase?('4SCORE!') == true
uppercase?('') == true

*problem*
input: string
output: boolean (true if all alphabetic characters are uppercase)

split string into array by characters
examine each character
ignore if non alphabetic
otherwise, check case
  if all are uppercase, return true
  otherwise, return false

*examples / test cases *
see above

*data structures*
string and boolean

*algorithm*
BEGIN
  declare method that takes a single string as an argument
    SET str_arr = arr of string broken into characters
    SET counter = 0
    WHILE there are characters remaining to evaluate (counter < str_arr.size)
      SET character = str_arr[counter]
      IF character is a letter
        IF character == uppercase
          increment counter += 1
        ELSE
          PRINT false
      ELSE
        increment counter += 1
      end
    PRINT true
END
=end

def uppercase?(str)
  return_val = true
  str.each_char do |chr|
    if chr =~ /[a-z]/i
      if chr =~ /[A-Z]/
        return_val
      else
        return_val = !return_val
      end
    end
  end
  return_val
end

# without nested if/else - not unnecessarily more clear
def uppercase?(str)
  return_val = true
  str.each_char do |chr|
    if chr =~ /[a-z]/i && chr =~ /[A-Z]/
      return_val
    elsif chr =~ /[a-z]/i && chr =~ /[^A-Z]/
      return_val = !return_val
    elsif chr =~ /[^a-z]/i
      return_val
    end
  end
  return_val
end

# condensed nested if/else into ternary expression
def uppercase?(str)
  return_val = true
  str.each_char do |chr|
    if chr =~ /[a-z]/i
      chr =~ /[A-Z]/ ? return_val : return_val = !return_val
    end
  end
  return_val
end

def uppercase?(str)
  str =~ /[a-z]/ ? false : true
end

# Course Solution - super simple, much like checking for palindromes using
# String#reverse
def uppercase?(string)
  string == string.upcase
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true

# Further Exploration
# Food for thought: in our examples, we show that uppercase? should return true
# if the argument is an empty string. Would it make sense to return false
# instead? Why or why not?

Yes, it should return false instead. Since the empty string does not contain any
characters, they can not be uppercase. Therefore the evaluation should return
false, based on the problem criteria ("returns true if all of the alphabetic
characters inside the string are uppercase, false otherwise."). 
