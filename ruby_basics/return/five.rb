5. Breakfast, Lunch, or Dinner? (Part 5)
What will the following code print? Why? Don't run it until you've attempted to answer.

def meal
  'Dinner'
  puts 'Dinner'
end

p meal

# first guess:
# This method call will return the string 'Dinner' (with quotes) and then will print the value Dinner (without quotes). Because the 'Dinner' return is implicit, it does not break the method at that point.

# what actually happens, based on observation:
# This method call prints the string 'Dinner' (without quotes) (from the "puts" command), then nil because the 'p' command prints the return value and the return value of a 'puts' command is always nil.
