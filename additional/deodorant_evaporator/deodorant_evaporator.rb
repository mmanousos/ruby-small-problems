# https://www.codewars.com/kata/5506b230a11c0aeab3000c1f
# Deodorant Evaporator
#
# This program tests the life of an evaporator containing a gas.
#
# We know the content of the evaporator (content in ml), the percentage of foam
# or gas lost every day (evap_per_day) and the threshold (threshold) in
# percentage beyond which the evaporator is no longer useful. All numbers are
# strictly positive.
#
# The program reports the nth day (as an integer) on which the evaporator will be
# out of use.
#
# Note : Content is in fact not necessary in the body of the function
# "evaporator", you can use it or not use it, as you wish. Some people might
# prefer to reason with content, some other with percentages only. It's up to
# you but you must keep it as a parameter because the tests have it as an
# argument.
#
# Problem
# given:
# the content of the evaporator (content in ml)
# percentage of foam or gas lost every day (evap_per_day)
# threshold percentage beyond which the evaporator is no longer useful (threshold)
#
# all positive numbers - not necessarily integers
#
# return:
# integer representing day on which evaporator will be out of use
#
# # Example / Tests
# evaporator(100, 25, 50) == 3
# evaporator(10, 10, 10) == 22
#
# day 1 == 75
# day 2 == 56.25
# day 3 == 42.1875
#
# Data Structure
#
#
# Algorithm
# BEGIN
# method `evaporator`(content, evap_per_day, threshold)
# start_value = content
# difference = content * (threshold / 100.0)
# counter = 0
# until content < difference
#   counter += 1
#   content -= (content * evap_per_day)
# end
# return integer = day that content < threshold
# END
#

# my solution
def evaporator(content, evap_per_day, threshold)
  day = 0
  difference = content * (threshold / 100.0)
  until content < difference
    day += 1
    content -= (content * (evap_per_day / 100.0))
  end
  day
end


# best solution
def evaporator(content, evap_per_day, threshold)
  day, percent = 1, 100
  day += 1 while (percent -= percent*evap_per_day/100.0) > threshold
  day
end


p evaporator(100, 25, 50) #== 3
p evaporator(10, 10, 10) #== 22
