# to check speed of programs. Counts how long each program takes to run by comparing the time at the end to the time when they started.

def profile block_description, &block
	start_time = Time.new
	block.call
	duration = Time.new - start_time
	puts "#{block_description}: #{duration} seconds"
end

profile '25000 doublings' do
	number = 1
	25000.times do
		number = number + number
	end
	puts "#{number.to_s.length} digits"
end

profile 'count a a million' do
	number = 0
	1000000.times do
		number - number + 1
	end
end

# Better Profiling - turn all profiling on and off by changing just one line of code. Just one word!
# set to true / false
# profiling_on = false
#  if profiling_on
		# ... code as it exists 
#  end
