=begin
Using some of Ruby's built-in Hash methods, write a program that loops through a hash and prints all of the keys.
Then write a program that does the same thing except printing the values. Finally, write a program that prints both.
=end

hash = {
	fruit: "orange",
	veg: "cucumber",
	meat: "chicken",
	starch: "potato",
	fat: "butter"
}

# just keys
puts hash.keys

# just values
puts hash.values

# both keys and values
hash.each { |k, v|
	puts "key = '#{k}' and value = '#{v}'"
}
