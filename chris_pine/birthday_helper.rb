=begin
Write a program to read in names and birthdates from a text file. It should then ask you for a name.
You type one in, and it tells you when that person's next birthday will be (and -extra credit- how old they will be).
First_name Last_name, month date, year
Probably will want to break up each line and put it into a hash using the name as key and date as value
e.g. birth_dates['First_name Last_name'] = 'Month date, year' (can store date in another format)

may want to use the .each_line method for strings. returns each line of the multiline string one at a time (with line endings - need to .chomp)

Create text file with names and birth dates
Import text file using YAML ?
Convert each line of text into hash value (use .each_line)
	Hash.new { |hash, key| hash[key] =  }

puts 'Whose birthday would you like to know?'
puts 'Please choose from: ' # lists all available names
query = gets.chomp

today = Time.new
this_year = calculate # of days to their next birthday by replacing year in their birthday with 2018 (or following year)
days = then subtracting 'today' from their birthday (this year or next), / 60 / 60 / 24
age = this_year - birth year

puts "#{query}'s next birthday is in #{days} days and they will be #{age} years old."

=end


data = File.read('birthdays.txt')
bday_hash = Hash.new
data.each_line {|line|
	info = line.split(',')
	name = info[0]
	date = info[1]
	year = info[2].chomp
	bday_hash[name] = date + ', ' + year
}


puts 'Whose birthday would you like to know?'
puts 'Choose from the following: '
display = bday_hash.each_key { |k|
	puts k
}
puts 'Please write the full name.'

query = gets.chomp
#add capitalization method (split query elements, capitalize each, merge back into single string)
cap_query = query.split.map(&:capitalize).join(' ')

birthdate = bday_hash[cap_query]
today = Time.new
this_year = today.year # extract only the year from 'today' (first four characters)

split_birthdate = birthdate.split(' ')
num_birthdate = []
case split_birthdate[0]
	when "January" then num_birthdate.push 1
	when "February" then num_birthdate.push 2
	when "March" then num_birthdate.push 3
	when "April" then num_birthdate.push 4
	when "May" then num_birthdate.push 5
	when "June" then num_birthdate.push 6
	when "July" then num_birthdate.push 7
	when "August" then num_birthdate.push 8
	when "September" then num_birthdate.push 9
	when "October" then num_birthdate.push 10
	when "November" then num_birthdate.push 11
	when "December" then num_birthdate.push 12
end
 # remove comma from day & convert to integer
num_birthdate.push split_birthdate[1].chomp(',').to_i
# convert year to integer
num_birthdate.push split_birthdate[2].to_i

birth_year = num_birthdate[2]

# birthdate that can be compared to current for calculation (for age)
calc_birthdate = Time.local(num_birthdate[2], num_birthdate[0], num_birthdate[1])
if today.month > num_birthdate[0]
	# add one year
	this_year = this_year+1
end

this_years_birthday = Time.local(this_year, num_birthdate[0], num_birthdate[1])
days = ((this_years_birthday - today) / 60 / 60 / 24).to_i
age = this_year - num_birthdate[2]


puts "* #{cap_query}'s next birthday is in #{days} days and they will be #{age} years old."
