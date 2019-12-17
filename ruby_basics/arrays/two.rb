# 2. More Than One
=begin
In the code below, an array containing different types of pets is assigned to pets.

pets = ['cat', 'dog', 'fish', 'lizard']
Select 'fish' and 'lizard' from pets at the same time, assign the return value to a variable named my_pets, then print the value of my_pets.

Expected output:

	I have a pet fish and a pet lizard!
=end

pets = ['cat', 'dog', 'fish', 'lizard']
my_pets = pets.select {|animal|
		animal.include?('i') # only includes animals with 'i' in their name
}

puts "I have a pet #{my_pets[0]} and a pet #{my_pets[1]}!"


my_pets = []
pets.each_with_index {|animal, idx|
		fewer_pets << animal if idx >= 2 # excludes the first two elements in the array
}

puts "I have a pet #{my_pets[0]} and a pet #{my_pets[1]}!"


# course solution uses a range (even more simple)
my_pets = pets[2..3]

puts "I have a pet #{my_pets[0]} and a pet #{my_pets[1]}!"
