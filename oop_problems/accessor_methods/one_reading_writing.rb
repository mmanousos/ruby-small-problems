# Reading and Writing
# Add the appropriate accessor methods to the following code.
#
# class Person
# end
#
# person1 = Person.new
# person1.name = 'Jessica'
# puts person1.name
# Expected output:
#
# Jessica

class Person
  attr_reader :name
  attr_writer :name
  # or can simply add attr_accessor :name
end

person1 = Person.new
person1.name = 'Jessica'
puts person1.name
