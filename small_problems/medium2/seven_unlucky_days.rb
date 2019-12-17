=begin
*assignment*
Unlucky Days
Write a method that returns the number of Friday the 13ths in the year given by
an argument. You may assume that the year is greater than 1752 (when the United
Kingdom adopted the modern Gregorian Calendar) and that it will remain in use
for the foreseeable future.

Examples:
friday_13th(2015) == 3
friday_13th(1986) == 1
friday_13th(2019) == 2

*problem*
input: four digit integer representing a year (greater than 1752)
output: integer representing how many Fridays the 13th will occur in that year.

use Date class to calculate 13th of each month in a given year.
Then use friday? method to check if each 13th is a Friday

*examples / test cases *
see above

*data structures*
array

*algorithm*
BEGIN
  require 'date'
  declare method that accepts one year integer as an argument
    SET thirteens = [] empty array
    SET counter = 1
    WHILE thirteens.size < 12
      push dates of Fridays into thirteens
      counter += 1
    SET count = 0
    Count dates from thirteens array that are Fridays
    PRINT count
END
=end

require 'date'
def friday_13th(year)
  thirteens = []
  counter = 1

  while thirteens.size < 12
    thirteens << Date.new(year, counter, 13)
    counter += 1
  end

  thirteens.count { |day| day.friday? }
end

# Course Solution
# Similar to a secondary solution I was trying to create. I was not familiar
# with the Date#next_month method to iterate through the months. I appreciate
# that this solution prevents the need to store all of the dates.
require 'date'

def friday_13th(year)
  unlucky_count = 0
  thirteenth = Date.new(year, 1, 13)
  12.times do
    unlucky_count += 1 if thirteenth.friday?
    thirteenth = thirteenth.next_month
  end
  unlucky_count
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2

# Further Exploration
=begin
An interesting variation on this problem is to count the number months that have
five Fridays. This one is harder than it sounds since you must account for leap
years.

BEGIN
  declare a method that accepts a year integer as an argument
    SET five_friday_months = 0
    get 29, 30 & 31 day of each applicable month
    IF 29, 30 or 31 == friday
      increment five_friday_months += 1
END
=end
require 'date'
LAST_DAYS = { 1 => 31, 2 => 28, 3 => 31, 4 => 30, 5 => 31, 6 => 30, 7 => 31,
              8 => 31, 9 => 30, 10 =>31, 11 => 30, 12 => 31 }

# basic looping logic
def five_fridays(year)
  five_friday_months = 0
  final_days = []
  counter = 1
  while counter <= 12
    if counter == 2 && Date.gregorian_leap?(year)
      final_days[0] = Date.new(year, counter, 29)
    else
      last = (29..LAST_DAYS[counter]).to_a
      last.each { |day| final_days << Date.new(year, counter, day) }
    end
    five_friday_months += 1 if final_days.any? { |day| day.friday? }
    final_days.clear
    counter += 1
  end
  five_friday_months
end

# Hash#each_pair
def five_fridays(year)
  five_friday_months = 0
  final_days = []
  LAST_DAYS.each_pair do |month, last_day|
    if month == 2 && Date.gregorian_leap?(year)
      final_days[0] = Date.new(year, month, 29)
    else
      last = (29..last_day).to_a
      last.each { |day| final_days << Date.new(year, month, day) }
    end
    five_friday_months += 1 if final_days.any? { |day| day.friday? }
    final_days.clear
  end
  five_friday_months
end

# Hash#each_pair - refactored to remove need for final_days array
def five_fridays(year)
  five_friday_months = 0
  LAST_DAYS.each_pair do |month, last_day|
    if month == 2 && Date.gregorian_leap?(year)
      last = Date.new(year, month, 29)
      five_friday_months += 1 if last.friday?
    else
      last = (29..last_day).to_a
      last.each do |day|
        last = Date.new(year, month, day)
        five_friday_months += 1 if last.friday?
      end
    end
  end
  five_friday_months
end

p five_fridays(2018) == 4
p five_fridays(2019) == 4
p five_fridays(2016) == 5
