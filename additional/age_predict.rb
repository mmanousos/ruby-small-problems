# Predict Your Age
# My grandfather always predicted how old people would get, and right before he passed away he revealed his secret!
#
# In honor of my grandfather we will write a function using his formula!
#
# Take a list of ages when each of your great-grandparent died.
# Multiply each number by itself.
# Add them all together.
# Take the square root of the result.
# Divide by two.
# Example:
# predict_age(65, 60, 75, 55, 60, 63, 64, 45) == 86
# Note: the result should be rounded down to the nearest integer.
#
# in: 8 integers
# out: 1 integer
#
# AL:
# square each integer, add all squares, square root of sum, divide square root / 2

def predict_age(age1, age2, age3, age4, age5, age6, age7, age8)
  ages = [age1, age2, age3, age4, age5, age6, age7, age8]
  ((Math::sqrt(ages.map { |age| age**2 }.sum)) / 2).to_i
end

p predict_age(65, 60, 75, 55, 60, 63, 64, 45)  == 86
