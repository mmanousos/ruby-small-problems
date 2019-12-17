# Students
# Below we have 3 classes: Student, Graduate, and Undergraduate. Some details for
# these classes are missing. Make changes to the classes below so that the
# following requirements are fulfilled:
#
# Graduate students have the option to use on-campus parking, while Undergraduate
# students do not.
#
# Graduate and Undergraduate students have a name and year associated with them.
#
# Note, you can do this by adding or altering no more than 5 lines of code.
#
#
# class Student
#   def initialize(name, year)
#     @name = name
#     @year = year
#   end
# end
#
# class Graduate
#   def initialize(name, year, parking)
#   end
# end
#
# class Undergraduate
#   def initialize(name, year)
#   end
# end


class Student
  attr_reader :name

  def initialize(name, year)
    @name = name
    @year = year
  end
end

class Graduate < Student # add class as child of `Student`
  def initialize(name, year, parking)
    super(name, year) # initialize name and year using method from parent class
    @parking = parking # initialize parking specific to this class only
  end
end

class Undergraduate < Student # add class as child of `Student`
  def initialize(name, year)
    super # initialize object as in parent class so no arguments need to be specified
    # without calling super, an object is created but no variables are initialized
  end
end

maria = Undergraduate.new('Maria', 'Freshman')
jeffrey = Graduate.new('Jeffrey', '2nd Year Graduate', true)
p maria
p jeffrey
