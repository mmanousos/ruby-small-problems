# Animal Kingdom
# The code below raises an exception. Examine the error message and alter the
# code so that it runs without error.

class Animal
  def initialize(diet, superpower)
    @diet = diet
    @superpower = superpower
  end

  def move
    puts "I'm moving!"
  end

  def superpower
    puts "I can #{superpower}!"
  end
end

class Fish < Animal
  def move
    puts "I'm swimming!"
  end
end

class Bird < Animal
end

class FlightlessBird < Bird
  def initialize(diet, superpower)
    super
  end

  def move
    puts "I'm running!"
  end
end

class SongBird < Bird
  def initialize(diet, superpower, song)
    super
    @song = song
  end

  def move
    puts "I'm flying!"
  end
end

# Examples

unicornfish = Fish.new(:herbivore, 'breathe underwater')
penguin = FlightlessBird.new(:carnivore, 'drink sea water')
robin = SongBird.new(:omnivore, 'sing', 'chirp chirrr chirp chirp chirrrr')

# An argument error is raised - that 3 arguments were passed in when only 2 were
# expected. This comes from the `SongBird` class when `robin` is instantiated.
# Without passing specific arguments to `super`, all arguments are passed.
# By adjusting the `super` invocation to specify that only `diet` and
# `superpower` should be passed, we resolve this error.

# class SongBird < Bird
#   def initialize(diet, superpower, song)
#     super(diet, superpower)
#     @song = song
#   end
#
#   def move
#     puts "I'm flying!"
#   end
# end

# Further Exploration
# Is the FlightlessBird#initialize method necessary? Why or why not?

# The initialize method for `FlightlessBird` is not necessary. Since the
# initialization of that class requires the same attributes as its parent class
# without any additional information, the `initialize` method from the parent
# class will be invoked without needing to define it explicitly. (This is also
# why `initialize` does not need to be defined within the `Bird` class.)
