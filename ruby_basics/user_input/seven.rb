# 7. User Name and Password
=begin
In the previous exercise, you wrote a program to solicit a password. In this exercise, you should modify the program so it also requires a user name. The program should solicit both the user name and the password, then validate both, and issue a generic error message if one or both are incorrect; the error message should not tell the user which item is incorrect.

Examples:

$ ruby login.rb
>> Please enter user name:
John
>> Please enter your password:
Hello
>> Authorization failed!
>> Please enter user name:
mary
>> Please enter your password:
SecreT
>> Authorization failed!
>> Please enter user name:
admin
>> Please enter your password:
root
>> Authorization failed!
>> Please enter user name:
admin
>> Please enter your password:
SecreT
Welcome!
=end

=begin #pseudocode
define username and password (both constants)
create loop
ask for username
assign this string to a variable
ask for password
assign this string to a second variable
break loop if both variables match the previously defined constants
otherwise print error message and continue
print welcome message
=end

USERNAME = 'Haley'
PASSWORD = 'This is FUN'
loop do
	puts '>> Please enter your username: '
	entered_username = gets.chomp
	puts '>> Please enter your password: '
	entered_password = gets.chomp
	break if ((entered_username == USERNAME) && (entered_password == PASSWORD))
	puts 'Username or password do not match our records.'
end
puts 'Right this way!'
