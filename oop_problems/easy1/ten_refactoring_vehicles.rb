# Refactoring Vehicles
# Consider the following classes:
#
# class Car
#   attr_reader :make, :model
#
#   def initialize(make, model)
#     @make = make
#     @model = model
#   end
#
#   def wheels
#     4
#   end
#
#   def to_s
#     "#{make} #{model}"
#   end
# end
#
# class Motorcycle
#   attr_reader :make, :model
#
#   def initialize(make, model)
#     @make = make
#     @model = model
#   end
#
#   def wheels
#     2
#   end
#
#   def to_s
#     "#{make} #{model}"
#   end
# end
#
# class Truck
#   attr_reader :make, :model, :payload
#
#   def initialize(make, model, payload)
#     @make = make
#     @model = model
#     @payload = payload
#   end
#
#   def wheels
#     6
#   end
#
#   def to_s
#     "#{make} #{model}"
#   end
# end
# Refactor these classes so they all use a common superclass, and inherit behavior as needed.

class Vehicle
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

  def to_s
    "#{make} #{model}"
  end
end

class Car < Vehicle
  def wheels
    4
  end
end

class Motorcycle < Vehicle
  def wheels
    2
  end
end

class Truck < Vehicle
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end

  def wheels
    6
  end
end

f150 = Truck.new('Ford', 'F150', '650 lbs')
integra = Car.new('Acura', 'Integra')
kawasaki = Motorcycle.new('kawasaki', 'Teryx')
puts f150.payload
puts integra
puts kawasaki.model

# Further Exploration
# Would it make sense to define a wheels method in Vehicle even though all of
# the remaining classes would be overriding it? Why or why not? If you think
# it does make sense, what method body would you write?

I believe it does not make sense to include a `#wheels` method in our `Vehicle`
superclass because there are other vehicles, such as boats, that could be
added as subclass and do not have wheels at all.
If we were to specify that all subclasses of our `Vehicle` class are wheeled
vehicles, the method could be specified as such:

class Wheeled_Vehicle
  attr_reader :make, :model, :wheels

  def initialize(make, model)
    @make = make
    @model = model
  end

  def wheels
    1 # the fewest possible wheels to still be in this class
  end

  def to_s
    "#{make} #{model}"
  end
end

class Car < Wheeled_Vehicle
  def wheels
    4
  end
end

class Motorcycle < Wheeled_Vehicle
  def wheels
    2
  end
end

class Truck < Wheeled_Vehicle
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end

  def wheels
    6
  end
end

class Unicycle < Wheeled_Vehicle
  # no need to define wheels here since it inherits the # of wheels
end

uni = Unicycle.new('Wheelie', 'Mabob')
puts uni.wheels # => 1
