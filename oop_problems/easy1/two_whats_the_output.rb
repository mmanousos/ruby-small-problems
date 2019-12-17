# What's the Output?
# Take a look at the following code:

# class Pet
#   attr_reader :name
#
#   def initialize(name)
#     @name = name.to_s
#   end
#
#   def to_s
#     @name.upcase!
#     "My name is #{@name}."
#   end
# end
#
# name = 'Fluffy'
# fluffy = Pet.new(name)
# puts fluffy.name
# puts fluffy
# puts fluffy.name
# puts name

# What output does this code print? Fix this class so that there are no surprises
# waiting in store for the unsuspecting developer.

# As written, this code outputs:
# Fluffy
# My name is FLUFFY.
# FLUFFY
# FLUFFY

class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

# name = 'Fluffy'
# fluffy = Pet.new(name)
# puts fluffy.name
# puts fluffy
# puts fluffy.name
# puts name

# Further Exploration
# What would happen in this case?

name = 42
fluffy = Pet.new(name)
name += 1
puts fluffy.name
puts fluffy
puts fluffy.name
puts name
# This code "works" because of that mysterious to_s call in Pet#initialize.
# However, that doesn't explain why this code produces the result it does.
# Can you?
The `to_s` method call within the `initialize` method assigns the `@name`
instance variable to the return value of the argument `name` converted to a
string. This allows the new string object `'42'` to have the `upcase` method
called on it without throwing an error.
Within the object, and for all methods called on the object, the name is the
string object `'42'`.
However the string object referred to by the `name` variable still exists
outside of the `fluffy` object and thus can be manipulated externally as well.
Outside of the object, the value referred to by `name` has been incremented
to `43`.
In order to assign the new value to the object, 1) a setter method would need to
be added to our class, and 2) the setter method would need to be called on the
object, assigning the new variable value to it, like so:

class Pet
  attr_accessor :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

name = 42
fluffy = Pet.new(name)
name += 1 # 43
puts fluffy.name # => 42
puts fluffy # => My name is 42.
puts fluffy.name # => 42
puts name # => 43
fluffy.name = name += 2 # references the external variable value `43`
puts fluffy.name # => My name is 45. (the revised value of our external `name` variable + 2)
