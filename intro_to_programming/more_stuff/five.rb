=begin
Why does the following code...

	def execute(block)
	  block.call
	end

	execute { puts "Hello from inside the execute method!" }

Give us the following error when we run it?

	block.rb1:in `execute': wrong number of arguments (0 for 1) (ArgumentError)
	from test.rb:5:in `<main>'

=end

The code is expecting an argument instead of a block so it returns an ArgumentError (becuse a block instead of an argument was passed to the method).
We correct for this by adding an ampersand before the 'block' parameter in the first line of the method declaration.
