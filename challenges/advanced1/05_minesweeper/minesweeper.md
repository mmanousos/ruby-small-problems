Minesweeper
Minesweeper is a popular game where the user has to find the mines using 
numeric hints that indicate how many mines are directly adjacent (horizontally, 
vertically, diagonally) to a square.

In this exercise you have to create some code that counts the number of mines 
adjacent to a square and transforms boards like this (where * indicates a mine):

+-----+
| * * |
|  *  |
|  *  |
|     |
+-----+
into this:

+-----+
|1*3*1|
|13*31|
| 2*2 |
| 111 |
+-----+

Class `Board`
Method `transform`
  takes input of printed board, returns board with integer of `'*'` adjacent to 
  each space.

input is an array of strings. each string represents the position of mines 
(marked by `'*'`). 

starting with second string (index 1 of the array), 
  iterate through the string, at each position, check if the space is a mine, 
  or is adjacent to a mine

  `check_left` `check_right`
  `check_top` `check_diagonal_top_left` `check_diagonal_top_right`
  `check_bottom` `check_diagonal_bottom_left` `check_diagonal_bottom_right`

only run checks, if the space is empty (`' '`)

Algorithm
BEGIN
  map over the array with index
    if element does not contain ' ', return element
    if element contains ' '
      split element into an array of characters
        map with index
        if character is not ' ', return character
        else
          for each element, create a counter starting at 0
          increment counter for each check that returns true
        return counter
      join
  return mapped array
END

check_left
element to index - 1 == '*'

check_right
element to index + 1 == '*'

check_top
element of previous element in parent array at same index == '*'

check_diagonal_top_left
element of previous element in parent array at index - 1 == '*'

check_diagonal_top_right
element of previous element in parent array at index + 1 == '*'

check_bottom
element of next element in parent array at same index == '*'

check_diagonal_bottom_left
element of next element in parent array at index - 1 == '*'

check_diagonal_bottom_right
element of next element in parent array at index + 1 == '*'

tests:
uneven lengths
  if all string elements of the array are not the same length

borders
if first or last string element of array contains characters other than '+' and '-'
  and if element 0 does not match pattern '+-+'
  and if element 0 does not match element -1
if elements between 1..-2 do not start and end with '|'

invalid characters
if elements between 1..-2 contain anything besides '|', '*' or ' '
