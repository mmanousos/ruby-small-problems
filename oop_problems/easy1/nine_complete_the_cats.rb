# Complete the Program - Cats!
# Consider the following program.
#
# class Pet
#   def initialize(name, age)
#     @name = name
#     @age = age
#   end
# end
#
# class Cat < Pet
# end
#
# pudding = Cat.new('Pudding', 7, 'black and white')
# butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
# puts pudding, butterscotch
# Update this code so that when you run it, you see the following output:
#
# My cat Pudding is 7 years old and has black and white fur.
# My cat Butterscotch is 10 years old and has tan and white fur.
#
class Pet
  def initialize(name, age)
    @name = name
    @age = age
  end
end

class Cat < Pet
  def initialize(name, age, color)
    super(name, age)
    @color = color
  end

  def to_s
    "My cat #{@name} is #{@age} years old and has #{@color} fur."
  end
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch

# Further Exploration
# An alternative approach to this problem would be to modify the Pet class to
# accept a colors parameter. If we did this, we wouldn't need to supply an
# initialize method for Cat.
#
# Why would we be able to omit the initialize method? Would it be a good idea
# to modify Pet in this way? Why or why not? How might you deal with some of
# the problems, if any, that might arise from modifying Pet?

If we edited the `#initialize` method in the `Pet` superclass to accept all
three arguments, we would not need to specify which arguments were passed to
it within the `Cat` class. We might not want to include a color for all pets
(since there may be some that do not have color variation - though I am hard
pressed to think of any right now). We could always assign `color` to the
default value of `false` in the `Pet` Class to account for a `color` argument
being omitted when a new `Pet` object of another type is created.


class Pet
  def initialize(name, age, color=false)
    @name = name
    @age = age
    @color = color
  end
end

class Cat < Pet
  def to_s
    "My cat #{@name} is #{@age} years old and has #{@color} fur."
  end
end

class Iguana < Pet
  def to_s
    "My iguana #{@name} is #{@age} years old."
  end
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch
sam = Iguana.new('Sam', 2)
puts sam
