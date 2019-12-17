=begin
*assignment*
Diamonds!
Write a method that displays a 4-pointed diamond in an n x n grid, where n is an
odd integer that is supplied as an argument to the method. You may assume that
the argument will always be an odd integer.

Examples
diamond(1)
*

diamond(3)
 *
***
 *

diamond(9)
    *
   ***
  *****
 *******
*********
 *******
  *****
   ***
    *

*problem*
input: integer n
output: printed diamond composed of '*' stars: n lines and with n as the max
number of stars at the midpoint (width)

assume integer is always positive

spacer = n / 2
stars = 1
lines = 0

while stars <= n
  puts "' ' * #{spacer}" + '*'
  lines += 1
  spacer -= 2
  stars += 2
end
while lines < n
  spacer -= 2
  stars += 2
  puts "' ' * #{spacer}" + '*'
  lines += 1
end


*examples / test cases *
see above

*data structures*


*algorithm*
BEGIN
  declare method that takes a single integer (num) as an argument
    SET spacer = num / 2
    SET stars = 1
    SET lines = 0
    WHILE stars <= num
      PRINT ' ' * spacer + '*' * stars
      increment lines += 1
      deincrement spacer -= 2
      increment stars += 2
    end
    WHILE lines < num
      incriment spacer += 2
      deincrement stars -= 2
      PRINT ' ' * spacer + '*' * stars
      increment lines += 1
    end
END


def diamond(num)
  puts ''
  spacer = num / 2
  stars = 1
  lines = 0
  while stars < num
    if spacer > 0
      puts ' ' * spacer + '*' * stars
      spacer -= 1
    else
      puts '*' * stars
    end
    lines += 1
    stars += 2
  end
  while lines < num
    if spacer < 0
      puts '*' * stars
    else
      puts ' ' * spacer + '*' * stars
    end
    stars -= 2
    spacer += 1
    lines += 1
  end
  puts ''
end
=end
# Course Solution - As I assumed, the course solution uses two methods: one to
# calculate the grid and one to print the rows of the diamond
def print_row(grid_size, distance_from_center)
  number_of_stars = grid_size - 2 * distance_from_center
  stars = '*' * number_of_stars
  puts stars.center(grid_size)
end

def diamond(grid_size)
  max_distance = (grid_size - 1) / 2
  max_distance.downto(0) { |distance| print_row(grid_size, distance) }
  1.upto(max_distance)   { |distance| print_row(grid_size, distance) }
end

diamond(1)

diamond(3)

diamond(9)


# Further Exploration
# Try modifying your solution or our solution so it prints only the outline of
# the diamond:

def diamond_outline(num)
  puts ''
  outer_spacer = num / 2
  inner_spacer = 0
  lines = 0
  while lines < num / 2
    if outer_spacer == num / 2
      puts ' ' * outer_spacer + '*'
      inner_spacer += 1
    else
      unless outer_spacer < 0
        puts ' ' * outer_spacer + '*' + ' ' * inner_spacer + '*'
        inner_spacer += 2
      end
    end
    outer_spacer -= 1
    lines += 1
  end
  while lines < num
    if outer_spacer < num / 2
      puts ' ' * outer_spacer + '*' + ' ' * inner_spacer + '*'
      inner_spacer -= 2
    else
      puts ' ' * outer_spacer + '*'
      inner_spacer -= 1
    end
    outer_spacer += 1
    lines += 1
  end
  puts ''
end

diamond_outline(5)
=begin
  *
 * *
*   *
 * *
  *
=end
diamond_outline(9)
=begin
     *
    * *
   *   *
  *     *
 *       *
  *     *
   *   *
    * *
     *
=end 
