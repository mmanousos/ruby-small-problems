4. Breakfast, Lunch, or Dinner? (Part 4)
What will the following code print? Why? Don't run it until you've attempted to answer.

def meal
  puts 'Dinner'
  return 'Breakfast'
end

puts meal

# this method call will print "Dinner", then "Breakfast" on a second line because the "Dinner" string is printed by the method before "Breakfast" is returned. 
