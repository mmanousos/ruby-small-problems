# Unlucky Days
# Write a method that returns the number of Friday the 13ths in the year given by an argument. You may assume that the year is greater than 1752 (when the United Kingdom adopted the modern Gregorian Calendar) and that it will remain in use for the foreseeable future.

# in: integer representing year
# out: integer representing number of Friday the 13ths in that year.

# AL: set counter for number of Friday the 13ths in the year
# initialize an instance of the Date class starting on the 13th of January for the given year. check if it is a Friday using the friday? method. Increment the month by using the next_month method 11 times, checking if each one is a Friday.
# increment the counter for matches.
# return counter

require 'date'
def friday_13th(year)
  friday_13ths = 0
  thirteenth = Date.new(year, 01, 13)
  12.times do
    friday_13ths += 1 if thirteenth.friday?
    thirteenth = thirteenth.next_month
  end

  friday_13ths
end 

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2
