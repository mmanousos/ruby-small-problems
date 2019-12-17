=begin
*assignment*
Clean up the words
Given a string that consists of some words and an assortment of non-alphabetic
characters, write a method that returns that string with all of the
non-alphabetic characters replaced by spaces. If one or more non-alphabetic
characters occur in a row, you should only have one space in the result (the
result should never have consecutive spaces).

Examples:
cleanup("---what's my +*& line?") == ' what s my line '

*problem*
input: string with non-letter characters (punctuation and extra spaces)
output: string with all punctuation and extra spaces removed

assume string is not empty

*examples / test cases *
see above

*data structures*
strings

*algorithm*
BEGIN
  declare method that accepts one string as an argument
    SET array of string broken by spaces
    evaluate each substring within the array
      break each substring into individual characters
        if the character is not a letter, replace it with a space
        remove repeated spaces
      recompile the substring into a string
    recompile the substrings into a single string
    PRINT the single string
END
=end

def cleanup(dirty_string)
  clean_string = dirty_string.split.map do |word|
    words = word.chars.map do |char|
      char =~ /\w/ ? char : ' '
    end
    words.join('')
  end
  clean_string.join(' ').squeeze
end

# Course solution
def cleanup(text)
  text.gsub(/[^a-z]/i, ' ').squeeze(' ')
end

# Further Exploration
=begin
If you originally wrote this method with regular expressions, try writing it
without regular expressions.
=end

Instead of using RegEx, check whether each character is included in the range of
capital A to lower-case z. If it is, map that character, otherwise map ' '.
Then join and sqeeze.

def cleanup(dirty_string)
  clean_string = dirty_string.split.map do |word|
    words = word.chars.map do |char|
      ('A'..'z').include?(char) ? char : ' '
    end
    words.join('')
  end
  clean_string.join(' ').squeeze
end

p cleanup("---what's my +*& line?") == ' what s my line '
