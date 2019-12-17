# Complete The Program - Houses
# Assume you have the following code:
#
# class House
#   attr_reader :price
#
#   def initialize(price)
#     @price = price
#   end
# end
#
# home1 = House.new(100_000)
# home2 = House.new(150_000)
# puts "Home 1 is cheaper" if home1 < home2
# puts "Home 2 is more expensive" if home2 > home1
# and this output:
#
# Home 1 is cheaper
# Home 2 is more expensive
# Modify the House class so that the above program will work. You are
# permitted to define only one new method in House.

# my solution (taking the wording of the problem very literally) -
# only defines one method but also changes the method used in the final `puts`
# call so both lines now use the same method.
# class House
#   attr_reader :price
#
#   def initialize(price)
#     @price = price
#   end
#
#   def <(other_home)
#     price < other_home.price
#   end
# end
#
# home1 = House.new(100_000)
# home2 = House.new(150_000)
# puts "Home 1 is cheaper" if home1 < home2 # => Home 1 is cheaper
# puts "Home 2 is more expensive" if home1 < home2 # => Home 2 is more expensive

# course solution, mixing in Comparable and defining combined comparison `<=>`
class House
  include Comparable

  attr_reader :price

  def initialize(price)
    @price = price
  end

  def <=>(other_home)
    price <=> other_home.price
  end
end

home1 = House.new(100_000)
home2 = House.new(150_000)
puts "Home 1 is cheaper" if home1 < home2 # => Home 1 is cheaper
puts "Home 2 is more expensive" if home2 > home1 # => Home 2 is more expensive

# Further Exploration
# Is the technique we employ here to make House objects comparable a good one?
# (Hint: is there a natural way to compare Houses? Is price the only criteria
# you might use?) What problems might you run into, if any? Can you think of
# any sort of classes where including Comparable is a good idea?

Houses may be compared on price, square footage, amenities, and a whole host of
other features. Setting up this comparison just for the price is probably too
limiting.
Classes where Comparable is better suited would be ones where the items can be
sorted into a specific order, like integrs or strings.
