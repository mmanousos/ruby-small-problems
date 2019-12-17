=begin
12. Given the following data structures. Write a program that moves the information from the array into the empty hash that applies to the correct person.

contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

=end

contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

# (question is unclear if data should be split into an additional hash within the provided empty hash; implied but not clear)

# solution 1 (all info in one array within hash, redundant)

contacts["Joe Smith"] = contact_data[0]
contacts["Sally Johnson"] = contact_data[1]


# solution 2 (info split into hashes, redundant)

contacts["Joe Smith"] = {:email => contact_data[0][0],
													:address => contact_data[0][1],
													:phone => contact_data[0][2]}
contacts["Sally Johnson"] = {:email => contact_data[1][0],
													:address => contact_data[1][1],
													:phone => contact_data[1][2]}

# 13. Using the hash you created from the previous exercise, demonstrate how you would access Joe's email and Sally's phone number?

puts "Joe's email is #{contacts["Joe Smith"][:email]}"
puts "Sally's phone number is #{contacts["Sally Johnson"][:phone]}"


# 14. In exercise 12, we manually set the contacts hash values one by one. Now, programmatically loop or iterate over the contacts hash from exercise 12, and populate the associated data from the contact_data array. Hint: you will probably need to iterate over ([:email, :address, :phone]), and some helpful methods might be the Array shift and first methods.
  # bonus: see if you can figure out how to make it work with multiple entries in the contacts hash.

# (Meets bonus criteria. Destructive to contact_data array.)
while contact_data.length > 0
	contacts.each { |k, v|
		contacts[k] = { email: contact_data[0][0], address: contact_data[0][1], phone: contact_data[0][2] }
		contact_data.shift
	}
end
