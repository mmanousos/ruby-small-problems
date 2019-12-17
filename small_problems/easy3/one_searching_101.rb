=begin
*assignment*
Searching 101
Write a program that solicits 6 numbers from the user, then prints a message
that describes whether or not the 6th number appears amongst the first 5
numbers.

Examples:

==> Enter the 1st number:
25
==> Enter the 2nd number:
15
==> Enter the 3rd number:
20
==> Enter the 4th number:
17
==> Enter the 5th number:
23
==> Enter the last number:
17
The number 17 appears in [25, 15, 20, 17, 23].


==> Enter the 1st number:
25
==> Enter the 2nd number:
15
==> Enter the 3rd number:
20
==> Enter the 4th number:
17
==> Enter the 5th number:
23
==> Enter the last number:
18
The number 18 does not appear in [25, 15, 20, 17, 23].

*problem*
input: integers - assume valid integers (not other data types)
output: string - sentence stating whether 6th value is one of the five previous
values entered, displayed in an array.
Gather each of first five integers into an array, then check if 6th is present.

*examples / test cases *
see above

*data structures*
integers into array
string

*algorithm*
START
  PUT 'Enter the 1st number:'
  GET & SET first_num converted to integer
  PUT 'Enter the 2nd number:'
  GET & SET second_num converted to integer
  PUT 'Enter the 3rd number:'
  GET & SET third_num converted to integer
  PUT 'Enter the 4th number:'
  GET & SET fourth_num converted to integer
  PUT 'Enter the 5th number:'
  GET & SET fifth_num converted to integer
  PUT 'Enter the last number:'
  GET & SET last_num converted to integer

  SET nums = array of first_num - fifth_num

  IF nums includes last_num
    SET present = 'does'
  ELSE
    SET present = 'does not'

  PRINT "The number " + last_num + present +  " appear in " + nums + "."
END
=end
puts '>> Enter the 1st number:'
first_num = gets.chomp.to_i
puts '>> Enter the 2nd number:'
second_num = gets.chomp.to_i
puts '>> Enter the 3rd number:'
third_num = gets.chomp.to_i
puts '>> Enter the 4th number:'
fourth_num = gets.chomp.to_i
puts '>> Enter the 5th number:'
fifth_num = gets.chomp.to_i
puts '>> Enter the last number:'
last_num = gets.chomp.to_i

nums = [first_num, second_num, third_num, fourth_num, fifth_num]

if nums.include?(last_num)
  present = 'appears'
else
  present = 'does not appear'
end

puts "The number #{last_num} #{present} in #{nums}."

# Even faster - add elements directly to array as they are gathered
# nums << gets.chomp.to_i and only assign final num to a variable.
# and have entire puts statement as output of if / else evaluation.
# avoids setting so many variables thereby taking up memory, even shortterm. 
