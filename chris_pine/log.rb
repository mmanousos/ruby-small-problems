=begin
Write a method called log that takes a sting description of a block (and, of course, a block).
It should puts a string telling you it started the block and another string at the end telling you it finished.
And telling you what the block returned.
Test it by sending it a code block.
Inside the block, put ANOTHER call to log, passing a block to it.
output should look something like:
	Beginning 'outer block'...
	Beginning 'some little block'...
	...'some little block' finished, returning:
	return value
	Beginning 'yet another block'...
	...'yet another block' finished, returning:
	new return value
	...'outer block' finished, returning: false
=end


def log description, &block
	puts "I'm starting '" + description + "' ..."
	result = block.call
	puts "...I'm finished with #{description}. It returned: #{result} "
end


log "outer block" do
	log "inner block 1" do
		'Insides are fun'
	end
	log "inner block 2" do
		5 - 2
	end
	5 % 5 == 2
end


=begin
Chris's "how I would do it" from the book

def log description, &block
	puts "I'm starting #{description.inspect}..."
	result = block[]
	puts "...#{description.inspect} finished. It returned: #{result}"
end


log "outer block" do
	log "inner block 1" do
		'Insides are fun'
	end
	log "inner block 2" do
		5 - 2
	end
	5 % 5 == 2
end
=end
