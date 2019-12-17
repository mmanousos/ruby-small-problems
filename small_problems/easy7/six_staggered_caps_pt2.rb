=begin
*assignment*
Staggered Caps (Part 2)
Modify the method from the previous exercise so it ignores non-alphabetic
characters when determining whether it should uppercase or lowercase each
letter. The non-alphabetic characters should still be included in the return
value; they just don't count when toggling the desired case.

Example:
staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
staggered_case('ALL CAPS') == 'AlL cApS'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

*problem*
input: string
output: string with every other letter capitalized starting at the first
character and skipping any non-alpha characters

*examples / test cases *
see above

*data structures*
strings

*algorithm*
BEGIN
  declare a method that takes one string as its sole argument
    SET alt_cap = empty new string to hold return value
    SET need_upper = true
    SET split_string = split string into an array of characters
    WHILE alt_cap size < string size
      check the type of each character
      IF char != letter
        add char to alt_cap string
      ELSE
        IF need_upper == true
          add char.upcase to alt_cap
        ELSE
          add char.downcase to alt_cap
        end
      need_upper = !need_upper (toggle need_upper to false)
    PRINT alt_cap
END
=end 

# Modified version of the Course Solution from the previous exercise. (The logic
# of my solution can not be altererd in the same way to allow for this
# adjustment.)
def staggered_case(str)
  alt_cap = ''
  need_upper = true
  split_str = str.chars
  split_str.each do |char|
    if char =~ /[^A-z]/
      alt_cap << char
    else
      if need_upper
        alt_cap << char.upcase
      else
         alt_cap << char.downcase
      end
      need_upper = !need_upper
    end
  end
  alt_cap
end

# p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
# p staggered_case('ALL CAPS') == 'AlL cApS'
# p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

# Further Exploration
=begin
Modify this method so the caller can determine whether non-alphabetic characters
should be counted when determining the upper/lowercase state. That is, you want
a method that can perform the same actions that this method does, or operates
like the previous version.
Hint: Use a keyword argument.
=end

# convoluted because of so many conditionals
def staggered_case_decide(string, use_all_char=false)
  alt_cap = ''
  need_upper = true
  split_str = string.chars
  split_str.each do |char|
    if use_all_char
      if need_upper
        alt_cap << char.upcase
      else
        alt_cap << char.downcase
      end
      need_upper = !need_upper
    else
      if char =~ /[^A-z]/
        alt_cap << char
      else
        if need_upper
          alt_cap << char.upcase
        else
           alt_cap << char.downcase
        end
        need_upper = !need_upper
      end
    end
  end
  alt_cap
end

def staggered_case_decide(str, use_all_char)
  alt_cap = ''
  need_upper = true
  split_str = str.chars
  split_str.each do |char|
    if use_all_char == 'use'
      if need_upper
        alt_cap << char.upcase
      else
         alt_cap << char.downcase
      end
      need_upper = !need_upper
    else
      if char =~ /[^A-z]/
        alt_cap << char
      else
        if need_upper
          alt_cap << char.upcase
        else
           alt_cap << char.downcase
        end
        need_upper = !need_upper
      end
    end
  end
  alt_cap
end

p staggered_case_decide('I Love Launch School!', 'skip') # == 'I lOvE lAuNcH sChOoL!'
p staggered_case_decide('ALL CAPS', 'use') # == 'AlL CaPs'
p staggered_case_decide('ignore 77 the 444 numbers', 'skip') # == 'IgNoRe 77 ThE 444 nUmBeRs'
