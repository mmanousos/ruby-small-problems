

# Part 1. Write a program that asks the user to type in their name and then prints out a greeting message with their name included.
# Part 2. Add another section that prints the name of the user 10 times. You must do this without explicitly writing the puts method 10 times in a row.

puts "Please tell me your name."
name = gets.chomp
puts "Hi, #{name}. That's such a cool name!"

10.times { puts name }
