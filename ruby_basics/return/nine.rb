9. Counting Sheep (Part 3)
What will the following code print? Why? Don't run it until you've attempted to answer.

def count_sheep
  5.times do |sheep|
    puts sheep
    if sheep >= 2
      return
    end
  end
end

p count_sheep

# guess
# This method call will print 0-2 exclusively. 2 will supercede 5 as the final return value of #times because of the explicit return.

# actually
# I neglected to notice that "p" not "puts" was used here, so nil is also printed since there is no return value from the "puts" command within the method.
