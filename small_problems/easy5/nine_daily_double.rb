=begin
*assignment*
ddaaiillyy ddoouubbllee
Write a method that takes a string argument and returns a new string that
contains the value of the original string with all consecutive duplicate
characters collapsed into a single character. You may not use String#squeeze or
String#squeeze!.

Examples:
crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''

*problem*
input: string
output: string

string may contain consecutive duplicate letter or number characters. Duplicates
should be reduced to a single character.

*examples / test cases *
see above

*data structures*
strings

*algorithm*
BEGIN
  declare method that accepts one string as an argument
    SET crunched_string = new empty string to hold output
    SET curr_char = first character in string
    WHILE there are characters in the string to evaluate
      add curr_char to new string
      SET next_char = curr_char + 1
      IF curr_char == next_char
        next_char += 1
      ELSE
        curr_char = next_char
      end
    end
    crunched_string
END
=end

# long version using standard loop
def crunch(string)
  crunched_string = ''
  counter = 0
  curr_char = string[counter]
  unless curr_char == nil
    crunched_string << curr_char
    loop do
      break if counter > string.size || counter + 1 == string.size
      next_char = string[counter+1]
      if curr_char == next_char
        counter += 1
      else
        crunched_string << next_char
        curr_char = next_char
      end
    end
  end
  crunched_string
end

# shorter - assessing last element of string and current element of array
def crunch(string)
  crunched_string = ''
  chars_array = string.chars
  chars_array.each_with_index do |char, idx|
    if chars_array[idx] != crunched_string[-1]
      crunched_string << chars_array[idx]
    end
  end
  crunched_string
end

# course solution
def crunch(text)
  index = 0
  crunch_text = ''
  while index <= text.length - 1
    crunch_text << text[index] unless text[index] == text[index + 1]
    index += 1
  end
  crunch_text
end

# Further Exploration
=begin
You may have noticed that we continue iterating until index points past the end
of the string. As a result, on the last iteration text[index] is the last
character in text, while text[index + 1] is nil. Why do we do this? What happens
if we stop iterating when index is equal to text.length - 1?
=end

Without moving past the end of the string, the final character would
not be examined and would be left off of the final string even if it were not a
duplicate.

=begin
Can you determine why we didn't use String#each_char or String#chars to iterate
through the string? How would you update this method to use String#each_char or
String#chars?
=end

My best guess is they did not use String#chars in the Course Solution because
it consumes more resources to convert to an array when it is unnecessary.

I used String#chars in my original two solutions. String#each_char could be
used the same way as I used Array#each_with_index in my second solution but it
would eliminate the need for converting the string to an array with String#chars
first. A faster process and therefore less resource-intensive solution!

def crunch(string)
  crunched_string = ''
  string.each_char do |char|
    if char != crunched_string[-1]
      crunched_string << char
    end
  end
  crunched_string
end

=begin
You can solve this problem using regular expressions (see the Regexp module
documentation). For a fun challenge, give this a try with regular expressions.
Can you think of other solutions besides regular expressions?
=end

I had a hard time with this part of the challenge. I knew about using /(.)\1/ to
search for duplicates but could not figure out which method to use.  I wound up
looking at the other student solutions. I am not totally sure why they had us
try this before reading the RegExp book.

def crunch(string)
  string.gsub(/(.)\1+/, '\1')
end

p crunch('ddaaiillyy ddoouubbllee') # == 'daily double'
p crunch('4444abcabccba') # == '4abcabcba'
p crunch('ggggggggggggggg') # == 'g'
p crunch('a') # == 'a'
p crunch('') # == ''
