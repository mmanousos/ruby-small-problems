=begin
Given the following code...

x = "hi there"
my_hash = {x: "some value"}
my_hash2 = {x => "some value"}
What's the difference between the two hashes that were created?
=end

The first hash uses a symbol as a key (and therefore is assigning the "some value" value to the key ':x').
The second hash uses the hash rocket key-value assignment system. It assigns the string that the variable x is referring to ("hi there") as the key.
