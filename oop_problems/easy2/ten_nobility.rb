# Nobility
# Now that we have a Walkable module, we are given a new challenge.
# Apparently some of our users are nobility, and the regular way of walking
# simply isn't good enough. Nobility need to strut.
#
# We need a new class Noble that shows the title and name when walk is called:
#
# byron = Noble.new("Byron", "Lord")
# p byron.walk
# # => "Lord Byron struts forward"
# We must have access to both name and title because they are needed for
# other purposes that we aren't showing here.
#
# byron.name
# => "Byron"
# byron.title
# => "Lord"

module Walkable
  def walk
    puts "#{name} #{gait} forward"
  end
end

class Person
  include Walkable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "strolls"
  end
end

class Cat
  include Walkable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "saunters"
  end
end

class Cheetah
  include Walkable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "runs"
  end
end

class Noble
  include Walkable
  attr_reader :name, :title

  def initialize(name, title)
    @name = name
    @title = title
  end

  def walk
    "#{full_name} #{gait} forward"
  end

  private

  def full_name
    "#{@title} #{@name}"
  end

  def gait
    "struts"
  end
end

byron = Noble.new("Byron", "Lord")
byron.walk # => "Lord Byron struts forward
p byron.name # => "Byron"
p byron.title # => "Lord"


# Further Exploration
# This exercise can be solved in a similar manner by using inheritance; a Noble
# is a Person, and a Cheetah is a Cat, and both Persons and Cats are Animals.
# What changes would you need to make to this program to establish these
# relationships and eliminate the two duplicated #to_s methods?

# I prefer this inheritance architecture because it does allow us to remove the
# redundant #to_s methods. In addition, it allows for removing redundant
# #initialize methods, including only the custom one in the Noble class to
# allow for both a name and title as arguments.

# class Animal
#   def walk
#     puts "#{self} #{gait} forward"
#   end
#
#   def initialize(name)
#     @name = name
#   end
#
#   def to_s
#     name
#   end
# end
#
# class Person < Animal
#   attr_reader :name
#
#   private
#
#   def gait
#     "strolls"
#   end
# end
#
# class Cat < Animal
#   attr_reader :name
#
#   private
#
#   def gait
#     "saunters"
#   end
# end
#
# class Cheetah < Cat
#   attr_reader :name
#
#   private
#
#   def gait
#     "runs"
#   end
# end
#
# class Noble < Person
#   attr_reader :name, :title
#
#   def initialize(name, title)
#     super(name)
#     @title = title
#   end
#
#   def to_s
#     "#{@title} #{@name}"
#   end
#
#   private
#
#   def gait
#     "struts"
#   end
# end
#
# byron = Noble.new("Byron", "Lord")
# byron.walk # => "Lord Byron struts forward
# p byron.name # => "Byron"
# p byron.title # => "Lord"


# Is to_s the best way to provide the name and title functionality we needed
# for this exercise? Might it be better to create either a different name
# method (or say a new full_name method) that automatically accesses @title
# and @name? There are tradeoffs with each choice -- they are worth considering.
This is how I originally approached the problem. But then it requires
overwriting the `walk` method which seemed to defeat the purpose of creating a
module.

An alternate solution from another student also requires overwriting the #walk method
  def walk
    print "#{title} "
    super
  end
