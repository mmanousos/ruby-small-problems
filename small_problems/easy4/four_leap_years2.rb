=begin
*assignment*
Leap Years (Part 2)
A continuation of the previous exercise.

The British Empire adopted the Gregorian Calendar in 1752, which was a leap
year. Prior to 1752, the Julian Calendar was used. Under the Julian Calendar,
leap years occur in any year that is evenly divisible by 4.

Using this information, update the method from the previous exercise to
determine leap years both before and after 1752.

leap_year?(2016) == true
leap_year?(2015) == false
leap_year?(2100) == false
leap_year?(2400) == true
leap_year?(240000) == true
leap_year?(240001) == false
leap_year?(2000) == true
leap_year?(1900) == false
leap_year?(1752) == true
leap_year?(1700) == true
leap_year?(1) == false
leap_year?(100) == true
leap_year?(400) == true

*problem*
input: integer
output: boolean

*examples / test cases *
see above

*data structures*
integers

*algorithm*
START
  declare method that accepts one integer as argument
    IF integer >= 1752
      use previous logic
    ELSE
      integer % 4 == 0
END
=end

def leap_year?(year)
  if year >= 1752
    ((year % 400 == 0) || (year % 4 == 0 && year % 100 != 0))
  else
    year % 4 == 0
  end
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true

# Further Exploration
=begin
Find a web page that talks about leap years or the different calendar systems,
and talk about the interesting information you learned. For instance, how was
the change from the Julian calendar to the Gregorian calendar handled in your
ancestral lands? Do they even use these calendar systems? If you live someplace
that doesn't use the Gregorian calendar, tell us about your calendar system.

According to wikipedia, folks in Greece didn't adopt the Gregorian calendar
until 1923! https://en.wikipedia.org/wiki/Adoption_of_the_Gregorian_calendar
For folks who were so advanced back in the day, they certainly were slow to
catch up with the rest of the world.
=end 
