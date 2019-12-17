require 'yaml' #initiates YAML for this program
test_array = ['give quiche a chance', 'mutants out!', 'chameleonic life-forms, no thanks'] # thing to save
test_string = test_array.to_yaml # converts thing to string
filename = 'RimmerTShirts.txt' # defines where it will be saved
File.open filename, 'w' do |f| # opens the file specified and 'writes' to the file - called 'f' here (could be anything)
	f.write test_string	# to that item 'f', write the "string" which is now the converted array, thanks to YAML
end # close the file

# YAML magic
read_string = File.read filename # defines a variable to read the newly created file
read_array = YAML::load read_string # defines a variable to read the "string", really the array originally created

puts (read_string == test_string)
puts (read_array == test_array)
