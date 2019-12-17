# 5. Combining Names
=begin
Using the following code, combine the two names together to form a full name and assign that value to a variable named full_name. Then, print the value of full_name.

first_name = 'John'
last_name = 'Doe'
Expected output:

	John Doe
=end

first_name = 'John'
last_name = 'Doe'

puts full_name = first_name + " " + last_name

# Further Exploration
=begin
Can you think of at least two additional ways to combine a first and last name into a full name?

1. interpolation
full_name = "#{first_name} #{last_name}"

2. put them into an array and then use #join method
arr = [first_name, last_name]
puts arr.join(" ")

=end
