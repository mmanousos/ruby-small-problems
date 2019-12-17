=begin
*assignment*
When will I Retire?
Build a program that displays when the user will retire and how many years she
has to work till retirement.

Example:
What is your age? 30
At what age would you like to retire? 70

It's 2016. You will retire in 2056.
You have only 40 years of work to go!

*problem*
input: two strings from user representing current age and retirement age
output: two strings containing the current year, the year the person will retire
and how many years between them.
Assume positive integers for input.
Get current year using Time.new
Calculate difference between current age and retirement age (retire - current)
Add difference to current year.
Return string: current year, retirement year, and difference is how many years
remaining for them to work. (interpolate values into string)

*examples / test cases *
age: 30; retire: 70 => current_year: 2018; retirement_year: 2058; remaining: 40
age: 18; retire: 75 => current_year: 2018; retirement_year: 2075; remaining: 57
age: 55; retire: 80 => current_year: 2018; retirement_year: 2043; remaining: 25

*data structures*
strings => integers
integers => strings

*algorithm*
START
  PUT What is your age?
  GET and SETS current_age

  PUT At what age would you like to retire?
  GET and SET retirement_age

  SET years_to_retirement = retirement_age - current_age
  SET current_year = Time.new.year
  SET retirement_year = current_year + years_to_retirement

  PUT It's current_year. You will retire in retirement_year.
  PUT You have only years_to_retirement years of work to go!
END
=end

puts 'What is your age?'
current_age = gets.chomp.to_i

puts 'At what age would you like to retire?'
retirement_age = gets.chomp.to_i

years_to_retirement = retirement_age - current_age
current_year = Time.new.year
retirement_year = current_year + years_to_retirement

puts "It's " + current_year.to_s + '. You will retire in ' +
     retirement_year.to_s + '.'
puts 'You have only ' + years_to_retirement.to_s + ' years of work to go!'
