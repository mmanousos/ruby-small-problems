# 6. Tricky Formatting
=begin
Using the following code, capitalize the value of state then print the modified value. Note that state should have the modified value both before and after you print it.

state = 'tExAs'
Expected output:

	Texas

=end

state = 'tExAs'
state = state.capitalize
puts state

# or could use
# state.capitalize!