# Hello, Chloe!
# Using the following code, add an instance method named #rename that
# renames kitty when invoked.
#
# class Cat
#   attr_accessor :name
#
#   def initialize(name)
#     @name = name
#   end
# end
#
# kitty = Cat.new('Sophie')
# kitty.name
# kitty.rename('Chloe')
# kitty.name
# Expected output:
#
# Sophie
# Chloe

class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def rename(new_name)
    @name = new_name
  end
end

# Above, we use the instance variable & simply reassign it to `new_name`
# Below, we use the setter method created by the command `attr_accessor` by
# calling `self.name`

class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def rename(new_name)
    self.name = new_name
    # could also be written as self.name=(new_name) for clarity
  end
end

kitty = Cat.new('Sophie')
p kitty.name # => Sophie
kitty.rename('Chloe')
p kitty.name # => Chloe
