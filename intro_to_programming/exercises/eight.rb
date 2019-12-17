# Create a Hash using both Ruby syntax styles.

hash1 = {
	key1: 'this is my value',
	key2: 'I sure can hold a lot in this hash',
	key3: 42,
	key4: true,
	key5: [27, false, 'apple', [18, true]]
}

hash2 = {
	'apple' => 'fruit',
	'x' => 'letter',
	[4, 7] => 'array',
	27 => 'number',
	{key: hash} => 'hash'
}

=begin
# bonus from Chris Pine's book
hash3 = Hash.new # or hash3 = {}

hash3[:name] = ['Melanie']
hash3[:age] = [42]
hash3[:hair] = ['brown']
hash3[:eyes] = ['green']
=end
