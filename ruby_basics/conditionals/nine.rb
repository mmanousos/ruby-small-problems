# 9. Cool Numbers
# In the code below, number is randomly assigned a number between 0 and 9. Then, an if statement is used to print "5 is a cool number!" or "Other numbers are cool too!" based on the value of number.

number = rand(10)

=begin
if number = 5
  puts '5 is a cool number!'
else
  puts 'Other numbers are cool too!'
end
=end

# Currently, "5 is a cool number!" is being printed every time the program is run. Fix the code so that "Other numbers are cool too!" gets a chance to be executed.


# fix
if number == 5  #above code was reassigning number to 5 instead of evaluating whether number was 5.
  puts '5 is a cool number!'
else
  puts 'Other numbers are cool too!'
end

# terminal actually issued a "warning: found = in conditional, should be ==". Very convenient. 
