# 10. Greet Your Friends
=begin
Your friends just showed up! Given the following array of names, use a for loop to greet each friend individually.

friends = ['Sarah', 'John', 'Hannah', 'Dave']
Expected output:

Hello, Sarah!
Hello, John!
Hello, Hannah!
Hello, Dave!
=end

friends = ['Sarah', 'John', 'Hannah', 'Dave']

for name in friends do # assign the variable to represent the items your iterating (use something descriptive like 'name'), then tell the program what the source is (friends array, could also be a range or hash)
  puts "Hi, #{name}!" # prints our greeting including the variable from the array
end
