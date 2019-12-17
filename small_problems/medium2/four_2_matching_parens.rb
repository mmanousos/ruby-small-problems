# Matching Parentheses?
# Write a method that takes a string as argument, and returns true if all parentheses in the string are properly balanced, false otherwise. To be properly balanced, parentheses must occur in matching '(' and ')' pairs.
# Note that balanced pairs must each start with a (, not a ).

# in: string that may contain parens
# out: boolean representing if the parens are matched

# AL:
# add a guard clause to return false if there are an uneven number of parens

# set up a counter = 0
#   iterate over string, incrementing up for each each open parens and down for each close parens.
#     return false if counter is ever < 0
#     return true if string iteration completes.

def balanced?(str)
  return false if str.count('(') != str.count(')')

  counter = 0
  str.each_char do |char|
    counter += 1 if char == '('
    counter -= 1 if char == ')'
    return false if counter < 0
  end

  true
end


p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
