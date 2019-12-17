=begin
*assignment*
How old is Teddy?
Build a program that randomly generates and prints Teddy's age. To get the age, you should generate a random number between 20 and 200.

Example Output
  Teddy is 69 years old!

*problem*
input: random number between 20-200
output: string including the random number
Generate a random number and interpolate / concatenate into the string

*examples / test cases *
see above

*data structures*
integer
string

*algorithm*
START
  years = rand(20..200)
  puts "Teddy is " + years.to_s + " years old!"
END
=end

years = rand(20..200)
puts "Teddy is " + years.to_s + " years old!"

# Further Exploration
=begin
Modify this program to ask for a name, and then print the age for that person.
For an extra challenge, use "Teddy" as the name if no name is entered.

puts 'Please give me a name:'
name = gets.chomp

if name.empty?
  name = 'Teddy'
end

years = rand(20..200)
puts name + " is " + years.to_s + " years old!"

# using a method, but doesn't work if name parameter is passed in.
puts 'Please give me a name:'
name = gets.chomp

def calculate_age(title='Teddy')
  years = rand(20..200)
  puts title + " is " + years.to_s + " years old!"
end

calculate_age
=end
