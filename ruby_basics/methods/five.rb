# 5. Make and Model
=begin
Using the following code, write a method called car that takes two arguments and prints a string containing the values of both arguments.

car('Toyota', 'Corolla')
Expected output:

Toyota Corolla
=end


def car(make, model)
	puts "#{make} #{model}"
end


car('Toyota', 'Corolla')


=begin
Further Exploration
Remove the #puts call from the car method. Modify your program so it still prints the result.


def car(make, model)
	 "#{make} #{model}"
end

puts car('Toyota', 'Corolla')

How do the return values of car differ with and without the #puts?
with "puts", the return value is "nil"; without, returns the string.

=end
