7. Counting Sheep (Part 1)
What will the following code print? Why? Don't run it until you've attempted to answer.

def count_sheep
  5.times do |sheep|
    puts sheep
  end
end

puts count_sheep

# guess
# This method call will print 'sheep' a total of 10 times because "puts" is used both in the method and in the method call.

# actually
# Counts from 0 - 5.
# Clearly, because the string 'sheep' was never specified, it would not print that value. but I am not sure why it prints more than 5 times.
# From the course explanation: #times always starts at 0 (good to know), and always returns the original integer (in this case 5) and since the method call specified to 'puts' the method, it printed the return value of 5 after the method block had printed the 5.times values of 0-4.
# need to remember that the return value is always the initial integer and that #times starts at 0.  
