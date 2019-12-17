=begin
*assignment*
Bannerizer
Write a method that will take a short line of text, and print it within a box.

Example:
print_in_box('To boldly go where no one has gone before.')
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+

print_in_box('')
+--+
|  |
|  |
|  |
+--+

You may assume that the input will always fit in your terminal window.

*problem*
input: string
output: same string surrounded by special characters.
with '|' characters on either side of it and one space to either side.
the same character above and below that as well as '+' above and below that.
with a series of '-' spanning the width of the string plus one on either side.

*examples / test cases *
see above

*data structures*
strings for input and output

*algorithm*
BEGIN
  Declare method that takes one string as an argument
    SET str_length = length of the string
    SET border_bound = str_length + 2
    PRINT '+' + border_bound times PRINT '-' + PRINT '+'
    PRINT '|' + border_bound times PRINT ' ' + PRINT '|'
    PRINT '| ' + string + ' |'
    PRINT '|' + border_bound times PRINT ' ' + PRINT '|'
    PRINT '+' + border_bound times PRINT '-' + PRINT '+'
END
=end

# working but redundant solution
def print_in_box(string)
  str_length = string.length
  border_bound = str_length + 2
  print '+'
  border_bound.times { print '-' }
  puts "+"
  print '|'
  border_bound.times { print ' ' }
  puts '|'
  puts '| ' + string + ' |'
  print '|'
  border_bound.times { print ' ' }
  puts '|'
  print '+'
  border_bound.times { print '-' }
  puts '+'
end

# solution with helper methods to minimize repetition
def border(width)
  print '+'
  width.times { print '-' }
  puts "+"
end

def spacer(width)
  print '|'
  width.times { print ' ' }
  puts '|'
end

def print_in_box(string)
  str_length = string.length
  border_bound = str_length + 2
  border(border_bound)
  spacer(border_bound)
  puts '| ' + string + ' |'
  spacer(border_bound)
  border(border_bound)
end

# most straight forward solution - creating one string for top/bottom borders
# and another for padding, then using puts to place each string on its own line.
def print_in_box(string)
  bound = "+#{'-' * (string.length + 2)}+"
  spacer = "|#{' ' * (string.length + 2)}|"
  puts bound
  puts spacer
  puts "| #{string} |"
  puts spacer
  puts bound
end

# Further Exploration
=begin
Modify this method so it will truncate the message if it will be too wide to fit
inside a standard terminal window (80 columns, including the sides of the box).
For a real challenge, try word wrapping very long messages so they appear on
multiple lines, but still within a box.
=end

# IF the string + 4 extra characters is greater than 80 characters long
#   reassign the string to a string only containing the first 76 characters
# use the new string to get the string length for bound and spacer

# if string.length + 4 > 80
#  string = substring from 0..75

def print_in_box_trim(string)
  if string.length + 4 > 80
    string = string[0...76]
  end
  str_leng = string.length
  bound = "+#{'-' * (str_leng + 2)}+"
  spacer = "|#{' ' * (str_leng + 2)}|"
  puts bound
  puts spacer
  puts "| #{string} |"
  puts spacer
  puts bound
end

=begin
BEGIN
  SET string_length = length of string
  IF string_length > 80
    SET width = 78
    SET bound = "+#{'-' * width}+"
    SET spacer = "|#{' ' * (width)}|"
    PRINT bound
    PRINT spacer
    WHILE string_length + 4 > 80
      SET sub_str = string[0..75]
      string.slice!(0..75)
      PRINT "| #{sub_str} |"
    SET new_string_length = length of remaining string
    SET filler = width - new_string_length
    # breaks when the string_length is < 80, calculate by how much smaller it is than the width,
    # then surround it with || and fill in by that many spaces
    PRINT "|#{string}#{' ' * filler}|"
    PRINT spacer
    PRINT bound
  ELSE
    width = string_length + 2
    bound = "+#{'-' * string_length}+"
    spacer = "|#{' ' * string_length}|"
    PRINT bound
    PRINT spacer
    PRINT "| #{string} |"
    PRINT spacer
    PRINT bound
END
=end

# a working version
def print_in_box_wrap(string)
  string_length = string.length
  if string_length > 80
    width = 78
    bound = "+#{'-' * width}+"
    spacer = "|#{' ' * width}|"
    puts bound
    puts spacer

    while string_length + 4 > 80
      sub_str = string[0..75]
      string.slice!(0..75)
      string_length = string.length
      puts "| #{sub_str} |"
    end

    new_string_length = string.length
    filler = width - new_string_length

    puts "|#{string}#{' ' * (filler)}|"
    puts spacer
    puts bound
  else
    width = string_length + 2
    bound = "+#{'-' * (width)}+"
    spacer = "|#{' ' * (width)}|"
    puts bound
    puts spacer
    puts "| #{string} |"
    puts spacer
    puts bound
  end
end

# using String#each_line
# break up into substring lines of 76 or fewer characters
# (insert \n new line character every 76 characters)
# then print each line wrapped in "|  |" using each_line

def print_in_box_wrap(string)
  max_width = 80
  string_length = string.length
  if string_length + 4 > max_width
    counter = string_length
    line_length = max_width - 4 # 76
    line_width = max_width - 2 # 78
    while counter + 4 >= max_width
      string.insert(line_length, '\n')
      line_length += line_width
      counter -= max_width
    end

    bound = "+#{'-' * line_width}+"
    spacer = "|#{' ' * line_width}|"
    puts bound
    puts spacer

    string.each_line('\n') do |substring|
      substring = substring.chomp('\n')
      ss_length = substring.length
      if ss_length == line_length
        puts "| #{substring} |"
      else
        puts "| #{substring}#{' ' * (76 - ss_length)} |"
      end
    end

    puts spacer
    puts bound

  else
    width = string_length + 2
    bound = "+#{'-' * (width)}+"
    spacer = "|#{' ' * (width)}|"
    puts bound
    puts spacer
    puts "| #{string} |"
    puts spacer
    puts bound
  end
end


print_in_box_wrap('To boldly go where no one has gone before.')
=begin
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+
=end

print_in_box_wrap('')
=begin
+--+
|  |
|  |
|  |
+--+
=end

print_in_box_trim('Spicy jalapeno bacon ipsum dolor amet capicola alcatra brisket ham hock pork porchetta filet mignon.')
=begin
+------------------------------------------------------------------------------+
|                                                                              |
| Spicy jalapeno bacon ipsum dolor amet capicola alcatra brisket ham hock pork |
|                                                                              |
+------------------------------------------------------------------------------+
=end

print_in_box_wrap('Spicy jalapeno bacon ipsum dolor amet capicola alcatra brisket ham hock pork porchetta filet mignon.')
=begin
+------------------------------------------------------------------------------+
|                                                                              |
| Spicy jalapeno bacon ipsum dolor amet capicola alcatra brisket ham hock pork |
| porchetta filet mignon.                                                      |
|                                                                              |
+------------------------------------------------------------------------------+
=end

print_in_box_wrap('Bacon ipsum dolor amet spare ribs cow jerky pork turducken, cupim flank salami pork chop pig hamburger capicola bacon rump shank. Frankfurter shankle brisket beef chuck turducken. Landjaeger sirloin pork chop strip steak shank jowl ham short ribs ham hock beef capicola porchetta turkey flank. Frankfurter porchetta pork, meatloaf ball tip strip steak tri-tip prosciutto hamburger tenderloin burgdoggen jowl swine short loin.')
=begin
+------------------------------------------------------------------------------+
|                                                                              |
| Bacon ipsum dolor amet spare ribs cow jerky pork turducken, cupim flank sala |
| mi pork chop pig hamburger capicola bacon rump shank. Frankfurter shankle br |
| isket beef chuck turducken. Landjaeger sirloin pork chop strip steak shank j |
| owl ham short ribs ham hock beef capicola porchetta turkey flank. Frankfurte |
| r porchetta pork, meatloaf ball tip strip steak tri-tip prosciutto hamburger |
|  tenderloin burgdoggen jowl swine short loin.                                |
|                                                                              |
+------------------------------------------------------------------------------+
=end
