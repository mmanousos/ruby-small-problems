=begin
Write a method that takes a block and calls it once for each hour that passed today.
that way if I were to pass in the block

do
	puts 'DONG!'
end

it would chime (sort of) like a grandfather clock.
Test with a few different blocks.

Hint: use Time.new.hour to get the current hour, but it returns 0-23.
Would need to convert to analog time.
=end

def clock descriptor, &block
	current_hour = Time.new.hour  # gets the time and converts from Mil. time
	if current_hour >= 12
		current_hour = current_hour - 12
	elsif current_hour < 1
		current_hour = 12
	end
	puts current_hour
	current_hour.times do
		block.call # call block once for each hour
	end
end

=begin
Chris's solution
def grandfather_clock &block
	hour = (Time.new.hour  + 11)%12 + 1
	hour.times(&block)
end

=end

clock 'dong' do
	puts "DONG!"
end

clock 'chirp' do
	puts 'tweet'
end

clock 'repeat' do
	puts 'this is redundant'
end
