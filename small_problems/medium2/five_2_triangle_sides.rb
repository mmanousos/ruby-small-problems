# Triangle Sides
# A triangle is classified as follows:

# equilateral All 3 sides are of equal length
# isosceles 2 sides are of equal length, while the 3rd is different
# scalene All 3 sides are of different length
# To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side, and all sides must have lengths greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

# Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending on whether the triangle is equilateral, isosceles, scalene, or invalid.

# in: 3 integers representing the lengths of a triangle
# out: one of four symbools represnting what type of triangle those integers describe

# AL:
#   put all 3 arguments into an array
#   set up guard clauses for :invalid conditions (if any are <= 0 & if sum of 2 shortest sides < length of longest side)
#   set up a conditional expression to return each of the appropriate symbols.
#   if all 3 are ==, return :equilateral
#   if 2 are == && their sum > 3rd, return :isosceles
#   if all 3 are different && sum of 2 shortest > 3rd, return :scalene
#   else return :invalid

def triangle(side1, side2, side3)
  sides = [side1, side2, side3].sort

  return :invalid if sides.include?(0) ||
                     sides[0] + sides[1] < sides[2]

  if sides.all? { |el| el == sides[0] }
    return :equilateral
  elsif (sides[0] == sides[1] || sides[1] == sides[2])
    return :isosceles
  elsif !sides.all? { |el| el == sides[0] }
    return :scalene
  else # this case is unnecessary 
    return :invalid
  end

end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
p triangle(1, 2, 4) == :invalid
