1. Breakfast, Lunch, or Dinner? (Part 1)
What will the following code print? Why? Don't run it until you've attempted to answer.

def meal
  return 'Breakfast'
end

puts meal

# The method itself won't print anything, but it will RETURN the string 'Breakfast' for use elsewhere. And since the method call "puts" the method return, it will print 'Breakfast'.
