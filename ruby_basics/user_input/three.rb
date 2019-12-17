# 3. Print Something (Part 1)
=begin
Write a program that asks the user whether they want the program to print "something", then print it if the user enters y. Otherwise, print nothing.

Examples:

$ ruby something.rb
>> Do you want me to print something? (y/n)
y
something

$ ruby something.rb
>> Do you want me to print something? (y/n)
n

$ ruby something.rb
>> Do you want me to print something? (y/n)
help
=end

=begin
loop do
	puts ">> Do you want me to print something? (y/n)"
	input = gets.chomp
	if input == 'y'
		puts "something"
		break
	end
end
=end

puts ">> Do you want me to print something? (y/n)"
input = gets.chomp
puts "something" if input == 'y'

=begin
Further Exploration
What happens if you type Y (in uppercase) instead of y in response to the prompt? This is a bad user experience: when obtaining input from a user, you should almost always allow both uppercase and lowercase entries. Can you modify this program so that it prints "something" if the user enters Y or y?

# to allow either uppercase or lowercase entry, either can make if evaluate for both instances, or, more simply, convert the input to either upper or lowercase.

puts ">> Do you want me to print something? (y/n)"
input = gets.chomp.downcase # convert all answers to lowercase to be able to compare with the provided comparison value
puts "something" if input == 'y'

puts ">> Do you want me to print something? (y/n)"
input = gets.chomp.downcase
puts "something" if ((input == 'y') || (input == 'Y')) # evaluate for both options upper or lower case. 

=end
