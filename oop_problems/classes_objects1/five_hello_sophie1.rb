# Hello, Sophie! (Part 1)
# Using the code from the previous exercise, add a parameter to #initialize that
# provides a name for the Cat object. Use an instance variable to print a
# greeting with the provided name. (You can remove the code that displays
# I'm a cat!.)
#
# Code:
#
# class Cat
#   def initialize
#     puts "I'm a cat!"
#   end
# end
#
# kitty = Cat.new('Sophie')
# Expected output:
#
# Hello! My name is Sophie!

class Cat
  def initialize(name)
    @name = name
    puts "Hello! My name is #{@name}!"
  end
end

kitty = Cat.new('Sophie') # => Hello! My name is Sophie!
