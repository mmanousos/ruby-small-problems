=begin
*assignment*
Staggered Caps (Part 1)
Write a method that takes a String as an argument, and returns a new String that
contains the original value using a staggered capitalization scheme in which
every other character is capitalized, and the remaining characters are lowercase.
Characters that are not letters should not be changed, but count as characters
when switching between upper and lowercase.

Example:
staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
staggered_case('ALL_CAPS') == 'AlL_CaPs'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

*problem*
input: string of characters
output: string of same length but with characters alternating capitalized and
downcase (odd characters are capitalized, even characters = downcase),
non-letter characters count for counting purposes.

*examples / test cases *
see above

*data structures*
strings

*algorithm*
BEGIN
  declare a method that takes one string as an argument
    SET characters = string split into array of characters
    WHILE there are characters remaining in the array to assess
      access each character with its index value
      IF the index value is even
        capitalize the character
      ELSE
        downcase the character
    PRINT characters array rejoined to a string
END
=end

# knowing I can append #with_index to the iteration methods simplifies things
# greatly though this is my first time implementing it in a solution.
def staggered_case(str)
  str.chars.map.with_index { |e, i| i.even? ? e.upcase : e.downcase }.join
end

# Course Solution - very different than mine as they implemented a toggle
# operation that simply switches whether an uppercase value is needed at the end
# of each loop.
def staggered_case(string)
  result = ''
  need_upper = true
  string.chars.each do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper
  end
  result
end

# Further Exploration
=begin
Modify this method so the caller can request that the first character be
downcased rather than upcased? If the first character is downcased, then the
second character should be upcased, and so on.
Hint: Use a keyword argument.
=end

To modify the course solution, a second argument is required determining if the
start of the capitalization should be in the first or second character
(determined with 'first' or 'second'). Then a single additional line of code can
be added, a ternary conditional assigning true / false to the need_upper
variable depending on whether that argument is 'first'.

def staggered_case_decision(string, start)
  result = ''
  need_upper = start == 'first' ? true : false
  string.chars.each do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper
  end
  result
end

Modifying my method is slightly more complicated, but not by much.

def staggered_case_decision(str, start)
  str.chars.map.with_index { |e, i|
    if start == 'first'
      i.even? ? e.upcase : e.downcase
    else
      i.odd? ? e.upcase : e.downcase
    end
    }.join
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

p staggered_case_decision('I Love Launch School!', 'first') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case_decision('ALL_CAPS', 'second') == 'aLl_cApS'
p staggered_case_decision('ignore 77 the 444 numbers', 'first') == 'IgNoRe 77 ThE 444 NuMbErS'
