=begin
*assignment*
Right Triangles
Write a method that takes a positive integer, n, as an argument, and displays a
right triangle whose sides each have n stars. The hypotenuse of the triangle
(the diagonal side in the images below) should have one end at the lower-left of
the triangle, and the other end at the upper-right.

Examples:

triangle(5)

    *
   **
  ***
 ****
*****

triangle(9)

        *
       **
      ***
     ****
    *****
   ******
  *******
 ********
*********

*problem*
input: integer
output: a printed triangle made up of stars
the bottom line of the triangle will contain as many stars as the integer.
each line above it will contain one fewer stars but be aligned to the right with
the bottom line (so will have spaces to represent the balance between its number
of stars and that of the final line.)

*examples / test cases *
see above

*data structures*
integers

*algorithm*
BEGIN
  declare a method that takes a single integer as an argument
  SET counter = 1
    WHILE counter <= integer
      PRINT ((integer - counter) * ' ') + counter * '*'
      increment counter += 1
    end
END
=end 

def triangle(int)
  counter = 1
  while counter <= int
    puts ( ' ' * (int - counter) ) + ( '*' * counter )
    counter += 1
  end
end

# Course Solution - uses more variables than my solution and therefore requires
# more incrementation, but achieves the same goal with the same logic. It is a
# bit more easily understood.
def triangle(num)
  spaces = num - 1
  stars = 1

  num.times do |n|
    puts (' ' * spaces) + ('*' * stars)
    spaces -= 1
    stars += 1
  end
end
=end
# Further Exploration
=begin
Try modifying your solution so it prints the triangle upside down from its
current orientation. Try modifying your solution again so that you can display
the triangle with the right angle at any corner of the grid.
=end

def invert_triangle(num)
  counter = num
  while counter >= 0
    puts ( ' ' * (num - counter) ) + ( '*' * counter )
    counter -= 1
  end
end

invert_triangle(5)
invert_triangle(9)

=begin
To print at any corner, need to determine which corner is being called for.
New method needs to accept three arguments: the integer and two directions
(top, bottom, right, left). These directions will indicate where the corner of
stars is displayed.

triangle_rotate(5, bottom, right)
    *
   **
  ***
 ****
*****

triangle_rotate(5, bottom, left)
*
**
***
****
*****

triangle_rotate(5, top, right)
*****
 ****
  ***
   **
    *

triangle_rotate(5, top, left)
*****
****
***
**
*
=end

# works but redundant
def triangle_rotate(num, side, edge)

  if edge == 'top'
    counter = 0
    while counter <= num

      if side == 'right'
        print_order = ( ' ' * (num - counter) ) + ( '*' * counter )
      else
        print_order = ( '*' * counter ) + ( ' ' * (num - counter) )
      end

      puts print_order
      counter += 1
    end
  else
    counter = num
    while counter >= 0

      if side == 'right'
        print_order = ( ' ' * (num - counter) ) + ( '*' * counter )
      else
        print_order = ( '*' * counter ) + ( ' ' * (num - counter) )
      end

      puts print_order
      counter -= 1
    end
  end

end

# slightly less redundant but still requires checking 'edge' 2x.
def triangle_rotate(num, side, edge)
  if edge == 'top'
    stars = num
    spaces = 0
  else
    stars = 1
    spaces = num - stars
  end

  num.times do |n|
    if side == 'right'
      puts (' ' * spaces) + ('*' * stars)
    else
      puts ('*' * stars) + (' ' * spaces)
    end

    if edge == 'top'
      stars -= 1
      spaces += 1
    else
      spaces -= 1
      stars += 1
    end
  end
end

triangle_rotate(5, 'right', 'top')
triangle_rotate(5, 'left', 'top')
triangle_rotate(5, 'right', 'bottom')
triangle_rotate(5, 'left', 'bottom')
