# Generic Greeting (Part 1)
# Modify the following code so that Hello! I'm a cat! is printed when
# Cat.generic_greeting is invoked.
#
# class Cat
# end
#
# Cat.generic_greeting
# Expected output:
#
# Hello! I'm a cat!

class Cat
  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end
end

Cat.generic_greeting # => Hello! I'm a cat!

# a class method declared prepended with `self.` can be called on the class itself.

# Further Exploration
# What happens if you run kitty.class.generic_greeting? Can you explain this result?
kitty = Cat.new
kitty.class.generic_greeting #=> Hello! I'm a cat!

Instantiating a new object, then calling the `#class` method on it returns the
class. So calling the class method `#generic_greeting` on the return value is
the same as calling the method directly on the class. 
