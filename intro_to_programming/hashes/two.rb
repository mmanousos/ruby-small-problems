=begin
Look at Ruby's merge method. Notice that it has two versions.
What is the difference between merge and merge!? Write a program that uses both and illustrate the differences.
=end

# both versions give precedence to the value in other_hash (the second has being merged in) for any duplicate keys present.
# .merge! permanently alters the first hash to contain all merged values (descructive), whereas .merge simply returns a new hash with the merged values (non-desctructive).

h1 = { w1: "This",
	w2: "exercise",
	w3: "is",
	w4: "challenging"
}

h2 = { w1: "This",
	w2: "exercise",
	w3: "is",
	w4: "easy",
	w5: "right?"
}

puts "hash 1: "
puts h1
h1.merge!(h2)
puts "hash 1 after bash merge with hash 2: "
puts h1

h3 = { w1: "We",
	w2: "should",
	w3: "turn",
	w4: "here"
}

puts "hash 3: "
puts h3
puts "hash 1 merged with hash 3: "
puts h1.merge(h3)
puts "but hash 1 remains unaltered: "
puts h1
