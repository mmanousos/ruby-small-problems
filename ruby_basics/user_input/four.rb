# 4. Print Something (Part 2)
=begin
In the previous exercise, you wrote a program that asks the user if they want the program to print "something". However, this program recognized any input as valid: if you answered anything but y, it treated it as an n response, and quit without printing anything.

Modify your program so it prints an error message for any inputs that aren't y or n, and then asks you to try again. Keep asking for a response until you receive a valid y or n response. In addition, your program should allow both Y and N (uppercase) responses; case sensitive input is generally a poor user interface choice. Whenever possible, accept both uppercase and lowercase inputs.

Examples:

$ ruby something2.rb
>> Do you want me to print something? (y/n)
y
something

$ ruby something2.rb
>> Do you want me to print something? (y/n)
help
>> Invalid input! Please enter y or n
>> Do you want me to print something? (y/n)
Y
something

$ ruby something2.rb
>> Do you want me to print something? (y/n)
N

$ ruby something2.rb
>> Do you want me to print something? (y/n)
NO
>> Invalid input! Please enter y or n
>> Do you want me to print something? (y/n)
n
=end

# my solution
loop do
	puts '>> Do you want me to print something? (y/n)'
	input = gets.chomp.downcase
	if input == 'y'
		puts 'something'
		break
	elsif input == 'n'
		break
	else
		puts ">> I don't understand that entry, please enter y/n"
	end
end

# course solution
=begin

choice = nil # create a variable that will be accessible within and outside of the loop
loop do
  puts '>> Do you want me to print something? (y/n)' # ask the question inside of the loop
  choice = gets.chomp.downcase # converts input to lowercase for uniformity
  break if %w(y n).include?(choice) # break if either of the valid options are met - checks value within argument against all elements in the provided array.
  puts '>> Invalid input! Please enter y or n' # otherwise alert to the error and ask again
end
puts 'something' if choice == 'y' # return a reply if they answered yes.

=end
