# Prefix the Name
# Using the following code, add the appropriate accessor methods so that @name
# is returned with the added prefix 'Mr.'.
#
# class Person
# end
#
# person1 = Person.new
# person1.name = 'James'
# puts person1.name
# Expected output:
#
# Mr. James

# My solution - permanently appends "Mr." to name on assignment
# class Person
#   attr_reader :name
#
#   def name=(name)
#     @name = "Mr. " + name
#   end
# end

# Course solution - only appends "Mr." to name on display
class Person
  attr_writer :name

  def name
    "Mr. " + @name
  end

end

person1 = Person.new
person1.name = 'James'
puts person1.name # => Mr. James
