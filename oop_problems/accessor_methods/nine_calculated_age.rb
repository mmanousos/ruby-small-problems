# Calculated Age
# Using the following code, multiply @age by 2 upon assignment, then multiply
# @age by 2 again when @age is returned by the getter method.
#
# class Person
# end
#
# person1 = Person.new
# person1.age = 20
# puts person1.age
# Expected output:
#
# 80

class Person
  def age=(age)
    @age = age * 2
    # @age *= 2  <= doesn't work because @age hasn't been assigned yet, so can't perform reassignment.  
  end

  def age
    @age *= 2
  end
end

person1 = Person.new
person1.age = 20
p person1.age # => 80
