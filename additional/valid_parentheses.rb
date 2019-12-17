# Write a function called that takes a string of parentheses,
#  and determines if the order of the parentheses is valid.
#   The function should return true if the string is valid,
#    and false if it's invalid.

# "()"              =>  true
# ")(()))"          =>  false
# "("               =>  false
# "(())((()())())"  =>  true

def valid_parentheses(str)
  counter = 0

  str.each_char do |char|
    if char == '('
      counter += 1
    elsif char == ')'
      counter -= 1
    end
    return false if counter < 0
  end

  counter == 0
end


p valid_parentheses( "()" ) == true
p valid_parentheses( "())" ) == false
p valid_parentheses( ")(()))"  ) == false
p valid_parentheses( "("  ) == false
p valid_parentheses( "(())((()())())"  ) == true
p valid_parentheses( "(()))("  ) == false
p valid_parentheses( "((((())))))(()"  ) == false
