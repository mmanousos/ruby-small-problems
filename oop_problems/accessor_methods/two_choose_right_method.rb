# Choose the Right Method
# Add the appropriate accessor methods to the following code.
#
# class Person
# end
#
# person1 = Person.new
# person1.name = 'Jessica'
# person1.phone_number = '0123456789'
# puts person1.name
# Expected output:
#
# Jessica

class Person
  attr_reader :name
  attr_writer :name, :phone_number
  # or can use attr_accessor :name 
end

person1 = Person.new
person1.name = 'Jessica'
person1.phone_number = '0123456789'
puts person1.name
