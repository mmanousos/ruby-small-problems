# Can hash values be arrays? Can you have an array of hashes? (give examples)

# Yes, hash values can be arrays:

my_hash = {
	fibonacci: [1, 1, 2, 3, 5, 8, 13, 21, 34, 55],
	circle: ["Pi = 3.14", "Pi(r**2)", "2 * r"],
	prime: [1, 2, 3, 5, 7, 9, 11, 13, 17]
}


# And arrays can contain hashes:

my_array = [{key1: "apple", color: 'blue', 'favorite_prime' => 7}, {2 => 'integer', 'color' => "red", array: [24, true]}]
