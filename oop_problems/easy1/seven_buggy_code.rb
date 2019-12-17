# Buggy Code - Car Mileage
# Fix the following code so it works properly:
#
# class Car
#   attr_accessor :mileage
#
#   def initialize
#     @mileage = 0
#   end
#
#   def increment_mileage(miles)
#     total = mileage + miles
#     mileage = total
#   end
#
#   def print_mileage
#     puts mileage
#   end
# end
#
# car = Car.new
# car.mileage = 5000
# car.increment_mileage(678)
# car.print_mileage  # should print 5678

class Car
  attr_accessor :mileage

  def initialize
    @mileage = 0
  end

  def increment_mileage(miles)
    total = mileage + miles
    # @mileage = total (this way bypasses the setter method)
    self.mileage = total # (this way calls the setter method: safer, in case it adjusts the ivar when setting it) 
  end

  def print_mileage
    puts mileage
  end
end

car = Car.new
car.mileage = 5000
car.increment_mileage(678)
car.print_mileage  # should print 5678

Because increment_mileage was not referring to the instance variable `@mileage`,
but rather an internally defined local variable `mileage`, the `#print_mileage`
call was only able to reference the unaffected `@mileage` which was still set to
`5000`.
