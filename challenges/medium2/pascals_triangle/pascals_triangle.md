Pascal's Triangle
Write a program that computes Pascal's triangle up to a given number of rows.

In Pascal's Triangle each number is computed by adding the numbers to the right and left of the current position in the previous row.

    1
   1 1
  1 2 1
 1 3 3 1
1 4 6 4 1
# ... etc

Problem
in: positive integer representing the number of rows in the triangle
out: nested array with each subsequent array listing the values that would be present in that row of the triangle
[[1]]

- first element of every triangle is 1
- do not need to worry about the display of the triangle itself
- length of each row increments up by 1

row 1: value 1
row 2: value 1, 1 = value index - 1 + value index + 1
rows 3: value 1, 2, 1

Methods
rows => returns nested array of all triangle rows
last => return only final row of triangle values

Example / Tests
1 = [[1]]
2 = [[1], [1, 1]]
3 = [[1], [1, 1], [1, 2, 1]]
4 = [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1]]

Data Structure
nested array
