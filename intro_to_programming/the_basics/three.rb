=begin
Write a program that uses a hash to store a list of movie titles with the year they came out.
Then use the puts command to make your program print out the year of each movie to the screen.
The output for your program should look something like this.
	1975
	2004
	2013
	2001
	1981
=end

movies = { 	frankenstein: '1931',
						high_noon: '1952',
						modern_times: '1936',
						the_jazz_singer: '1927',
						sullivans_travels: '1941' }

puts movies[:frankenstein]
puts movies[:high_noon]
puts movies[:modern_times]
puts movies[:the_jazz_singer]
puts movies[:sullivans_travels]
