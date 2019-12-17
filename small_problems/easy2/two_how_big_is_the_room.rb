=begin
*assignment*
How big is the room?
Build a program that asks a user for the length and width of a room in meters
and then displays the area of the room in both square meters and square feet.

Note: 1 square meter == 10.7639 square feet

Do not worry about validating the input at this time.

Example Run
  Enter the length of the room in meters:
  10
  Enter the width of the room in meters:
  7
  The area of the room is 70.0 square meters (753.47 square feet).

*problem*
input: two numbers (could be integers or floats), length & width
output: string with calculated area in square meters and square feet
assumes integers will be positive numbers

*examples / test cases *
see above

*data structures*
input: numbers
output: string

*algorithm*
START
  puts 'Welcome. I will help you calculate the area of your room.'

  puts 'Enter the length of the room in meters:'
  GET length = SET length
  convert length to float

  puts 'Enter the width of the room in meters:'
  GET width = SET width
  convert width to float

  area_meters = length * width
  area_feet = area_meters * 10.7639

  PRINT The area of the room is area_meters square meters
  (area_feet square feet).
END
=end

SQ_METERS_TO_SQ_FEET = 10.7639

puts 'Welcome. I will help you calculate the area of your room.'

puts 'Enter the length of the room in meters:'
length = gets.chomp.to_f

puts 'Enter the width of the room in meters:'
width = gets.chomp.to_f

area_meters = length * width
area_feet = area_meters * SQ_METERS_TO_SQ_FEET.round(2)

puts "The area of the room is #{area_meters} square meters" \
     "(#{area_feet} square feet)."


# Further Exploration
=begin
Modify this program to ask for the input measurements in feet, and display the
results in square feet, square inches, and square centimeters.


SQ_FEET_TO_SQ_INCHES = 144
SQ_INCHES_TO_SQ_CM = 0.15500

puts 'Welcome. I will help you calculate the area of your room.'

puts 'Enter the length of the room in feet:'
length = gets.chomp.to_f

puts 'Enter the width of the room in feet:'
width = gets.chomp.to_f

area_feet = length * width
area_inches = area_feet * SQ_FEET_TO_SQ_INCHES
area_cm = (area_inches / SQ_INCHES_TO_SQ_CM).truncate(2)

puts "The area of the room is #{area_feet} square feet" \
     " (#{area_inches} square inches or #{area_cm} square centimeters)."

#7 * 10 => 70 sq feet, 10080 sq inches & 65032.13 sq cm
#12.5 * 20.5 => 256.25 sq ft, 36900 sq inches & 238064.0 sq sm
=end
