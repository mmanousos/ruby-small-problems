# What method could you use to find out if a Hash contains a specific value in it? Write a program to demonstrate this use.

pets_for_adoption = {
		"cat" => "Garfield",
		"dog" => "Odie",
		"duck" => "Daffy",
		"bunny" => "Bugs",
		"mouse" => "Mickey"
}

# .has_key? is the method to check true / false if a hash contains a specific key.

if pets_for_adoption.has_key?("snake")
	puts "Wow, #{pets_for_adoption["snake"]} is a mighty big snake!"
else
	puts "We're clean out of snakes today. Would you prefer a dog? #{pets_for_adoption["dog"]}, is a sweetheart."
end
