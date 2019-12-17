# Reverse Engineering
# Write a class that will display:
#
# ABC
# xyz
# when the following code is run:
#
# my_data = Transform.new('abc')
# puts my_data.uppercase
# puts Transform.lowercase('XYZ')

class Transform
  attr_writer :string

  def initialize(string)
    @string = string
  end

  def uppercase
    @string.upcase
  end

  def self.lowercase(string)
    string.downcase
  end
end

my_data = Transform.new('abc')
puts my_data.uppercase # => ABC
puts Transform.lowercase('XYZ') # => xyz
