# 4. Loop on Command
# Modify the code below so the loop stops iterating when the user inputs 'yes'.

loop do
  puts 'Should I stop looping?'
  answer = gets.chomp
	break if answer == 'yes' # adding a break with a conditional allows for the program respond to the received input.
	puts "'yes' will exit the loop" # can also add an error message in case the user doesn't input the expected value
end
