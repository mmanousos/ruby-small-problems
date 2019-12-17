# 10. Greeting
=begin
Given the code below, use a while loop to print "Hello!" twice.

def greeting
  puts 'Hello!'
end

number_of_greetings = 2
=end


def greeting
  puts 'Hello!'
end

number_of_greetings = 2

while number_of_greetings > 0 # set up a condition based on the available counter that, when met, will break the loop
	greeting # call the method
	number_of_greetings -= 1 # reduce counter
end
