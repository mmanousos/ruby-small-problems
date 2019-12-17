8. Counting Sheep (Part 2)
What will the following code print? Why? Don't run it until you've attempted to answer.

def count_sheep
  5.times do |sheep|
    puts sheep
  end
  10
end

puts count_sheep

# This version of the method call will print the integers 0-4 and then 10. Since the #times method returns the original integer, it would return 5, but then 10 is the final integer referenced and therefore the final return value. 
