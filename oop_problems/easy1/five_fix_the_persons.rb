# Fix the Program - Persons
# Complete this program so that it produces the expected output:
#
# class Person
#   def initialize(first_name, last_name)
#     @first_name = first_name.capitalize
#     @last_name = last_name.capitalize
#   end
#
#   def to_s
#     "#{@first_name} #{@last_name}"
#   end
# end
#
# person = Person.new('john', 'doe')
# puts person
#
# person.first_name = 'jane'
# person.last_name = 'smith'
# puts person
# Expected output:
#
# John Doe
# Jane Smith

class Person
  def initialize(first_name, last_name)
    @first_name = first_name.capitalize
    @last_name = last_name.capitalize
  end

  def first_name=(value)
    @first_name = value.capitalize
  end

  def last_name=(value)
    @last_name = value.capitalize
  end

  def to_s
    "#{@first_name} #{@last_name}"
  end
end

person = Person.new('john', 'doe')
puts person # => John Doe

person.first_name = 'jane'
person.last_name = 'smith'
puts person # => Jane Smith

# Requires adding a setter method that includes the #capitalize method call.
