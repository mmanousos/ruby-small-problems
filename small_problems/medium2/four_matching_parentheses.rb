=begin
*assignment*
Matching Parentheses?
Write a method that takes a string as argument, and returns true if all
parentheses in the string are properly balanced, false otherwise. To be properly
balanced, parentheses must occur in matching '(' and ')' pairs.

Examples:
balanced?('What (is) this?') == true
balanced?('What is) this?') == false
balanced?('What (is this?') == false
balanced?('((What) (is this))?') == true
balanced?('((What)) (is this))?') == false
balanced?('Hey!') == true
balanced?(')Hey!(') == false
balanced?('What ((is))) up(') == false

Note that balanced pairs must each start with a (, not a ).

*problem*
input: string
output: boolean

for each '(' open parentheses, there must be one matching ')' closing parentheses.

edge case: first parens may be ')' - check if first index of ')' is lower than
  first index of '('
edge case: last parens may be '(' - get last index of '(' & check if it's lower
  than last index of ')'
edge case: string may contain 0 parens - then will return nil for both
  first_open and first_closed, can't use <, just need to check if they are
  equivalent


count all open and closed parens
if their numbers are equal && first parens is '(', true
else, false

*examples / test cases *
see above

*data structures*
array

*algorithm*
BEGIN
  declare a method that takes one string as an argument
    SET open = count of '(' open parens in string
    SET closed = count of ')' closed parens in string
    SET first_open = index of first '('
    SET first_closed = index of first ')'
    IF open == closed && first_open <= first_closed
      return true
    ELSE
      return false
END
=end

# long but works to catch edge cases of no parens and parens opened out of order
def balanced?(string)
  open_parens = string.count('(')
  closed_parens = string.count(')')
  first_open = string.index('(')
  first_closed = string.index(')')
  last_open = string.reverse.index('(')
  last_closed = string.reverse.index(')')

  if open_parens == closed_parens &&
     (first_open == first_closed || first_open < first_closed) &&
     (last_open == last_closed || last_open > last_closed)
    return true
  else
    return false
  end
end

# Course Solution
def balanced?(string)
  parens = 0
  string.each_char do |char|
    parens += 1 if char == '('
    parens -= 1 if char == ')'
    break if parens < 0
  end

  parens.zero?
end

# Further Exploration
=begin
There are a few other characters that should be matching as well. Square
brackets and curly brackets normally come in pairs. Quotation marks(single and
double) also typically come in pairs and should be balanced. Can you expand
this method to take into account those characters?
=end

def balanced?(string)
  parens = 0
  string.each_char do |char|
    parens += 1 if char =~ /[({\[\"\']/
    parens -= 1 if char =~ /[)}\]\"\']/
    break if parens < 0
  end

  parens.zero?
end

p balanced?('[where?]') == true
p balanced?('""') == true
p balanced?("{}") == true
p balanced?("}") == false

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
