=begin
*assignment*
Triangle Sides
A triangle is classified as follows:
equilateral - All 3 sides are of equal length
isosceles - 2 sides are of equal length, while the 3rd is different
scalene - All 3 sides are of different length
To be a valid triangle, the sum of the lengths of the two shortest sides must be
greater than the length of the longest side, and all sides must have lengths
greater than 0: if either of these conditions is not satisfied, the triangle is
invalid.

Write a method that takes the lengths of the 3 sides of a triangle as arguments,
and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending
on whether the triangle is equilateral, isosceles, scalene, or invalid.

Examples:
triangle(3, 3, 3) == :equilateral
triangle(3, 3, 1.5) == :isosceles
triangle(3, 4, 5) == :scalene
triangle(0, 3, 3) == :invalid
triangle(3, 1, 1) == :invalid

*problem*
input: three integers representing the lengths of three sides of a triangle
output: symbol representing the type of triangle described by the integer lengths

*examples / test cases *
see above

*data structures*


*algorithm*
pass args into an array
sorth the array shortest to longest.
if array[0] == 0, return :invalid
if array[0] + array[1] < array[2], return :invalid
if array[0] == array[1] == array[2], return :equilateral
if array.each { |side| return :isocoles if array.count(side) == 2 }
if array[0] == array[1] or array[1] == array[2] or array[2] == array[0], return :isocoles
else return :scalene
=end

def triangle(side1, side2, side3)
  sides = [side1, side2, side3].sort
  if sides[0] == 0 || sides[0] + sides[1] < sides[2]
    return :invalid
  elsif sides[0] == sides[1] && sides[1] == sides[2]
    return :equilateral
  elsif sides.each { |side| return :isosceles if sides.count(side) == 2 }
    # sides[0] == sides[1] || sides[1] == sides[2] || sides[2] == sides[0]
  end
  return :scalene
end

# Course Solution
=begin
Similar logic to me of putting all the side lengths into an array.
But then they used the Array#max method to get the longest side. I don't know
that it makes any more sense than the way I calculated it. I think mine is more
straight forward based on the explanation of the problem.
I thought about using a case statement but wasn't sure if it would work with the
evaluations in the same way as providing strings.
=end
def triangle(side1, side2, side3)
  sides = [side1, side2, side3]
  largest_side = sides.max

  case
  when 2 * largest_side > sides.reduce(:+), sides.include?(0)
    :invalid
  when side1 == side2 && side2 == side3
    :equilateral
  when side1 == side2 || side1 == side3 || side2 == side3
    :isosceles
  else
    :scalene
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
