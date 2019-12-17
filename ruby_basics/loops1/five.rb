# 5. Say Hello
# Modify the code below so "Hello!" is printed 5 times.

say_hello = true

while say_hello
  5.times { puts 'Hello!' } # added the method '.times' with the desired output number before setting the variable value to false to exit the program. (Redundant to use '.times' method in a loop.)
  say_hello = false
end


# can also add a counter and increment the counter as in exercise three.
say_hello = true
counter = 0

while say_hello
  puts 'Hello!'
	counter += 1
  say_hello = false if counter == 5
end
