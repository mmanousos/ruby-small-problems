# 6. Passwords
=begin
Write a program that displays a welcome message, but only after the user enters the correct password, where the password is a string that is defined as a constant in your program. Keep asking for the password until the user enters the correct password.

Examples:

$ ruby password.rb
>> Please enter your password:
Hello
>> Invalid password!
>> Please enter your password:
Secret
>> Invalid password!
>> Please enter your password:
SecreT
Welcome!
=end

=begin #pseudocode
define a password as a string.
create a loop to ask the user for their password.
if the password doesn't match, display an error message and repeat loop
otherwise output a welcome message.
=end

PASSWORD = 'let me IN' # all caps = a constant
loop do
	puts ">> Please provide your password: "
	user_pass = gets.chomp # do not up or downcase because password is case sensitive
	break if user_pass == PASSWORD
	puts ">> Invalid password!"
end
puts 'Right this way!'
