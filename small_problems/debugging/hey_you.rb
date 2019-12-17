=begin
*assignment*
HEY YOU!
String#upcase! is a destructive method, so why does this code print HEY you
instead of HEY YOU? Modify the code so that it produces the expected output.

def shout_out_to(name)
  name.chars.each { |c| c.upcase! }

  puts 'HEY ' + name
end

shout_out_to('you') # expected: 'HEY YOU'
=end

def shout_out_to(name)
  name = name.chars.each { |c| c.upcase! }.join

  puts 'HEY ' + name
end

shout_out_to('you')
=begin
String#chars creates a new array containing each character of the string.
String#upcase! is mutating the strings within that new array but they are not
being assigned to the original name variable.
In order to have a the mutated string returned, we can reassign the new array to
the name variable. And then, we need to join the array (created by String#chars)
back into a string before using the #+ method to output it as a string with the
#puts method.
=end

# Course Solution(s)
# mutate name directly
def shout_out_to(name)
  name.upcase!

  puts 'HEY ' + name
end

shout_out_to('you')

# or upcase it directly
def shout_out_to(name)
  puts 'HEY ' + name.upcase
end

shout_out_to('you')
