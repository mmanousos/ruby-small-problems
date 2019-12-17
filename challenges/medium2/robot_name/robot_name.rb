# with an array - "expensive" to search from a time complexity standpoint
class Robot
  attr_accessor :name

  @@robot_names = []

  LETTERS = [*'A'..'Z'].freeze
  NUMBERS = [*0..9].freeze

  def initialize
    name_robot
  end

  def reset
    name.clear
    @@robot_names.pop
    name_robot
  end

  private

  def generate_name
    result = ''
    2.times { result << LETTERS.sample }
    3.times { result << NUMBERS.sample.to_s }
    name_available?(result) ? result : generate_name
  end

  def name_robot
    @name = generate_name
    @@robot_names << name
  end

  def name_available?(name)
    !@@robot_names.include?(name)
  end
end

# with a hash - far less expensive from a time complexity standpoint
class Robot
  attr_accessor :name

  @@robot_names = {}
  
  def initialize
    name_robot
  end

  def reset
    @@robot_names.delete(name)
    name_robot
  end

  private

  def generate_name
    result = ''
    2.times { result << [*'A'..'Z'].sample }
    3.times { result << [*0..9].sample.to_s }
    name_available?(result) ? result : generate_name
  end

  def name_robot
    @name = generate_name
    @@robot_names[name] = name
  end

  def name_available?(name)
    @@robot_names[name].nil?
  end
end

# with a Set - equivalent to Hash in time complexity expense
require 'set'

class Robot
  attr_accessor :name

  @@robot_names = Set[]

  def initialize
    name_robot
  end

  def reset
    @@robot_names.delete(name)
    name_robot
  end

  private

  def generate_name
    result = ''
    2.times { result << [*'A'..'Z'].sample }
    3.times { result << [*0..9].sample.to_s }
    name_available?(result) ? result : generate_name
  end

  def name_robot
    @name = generate_name
    @@robot_names.add(name)
  end

  def name_available?(name)
    !@@robot_names.include?(name)
  end
end

# create all possible names, randomize and then assign seqentially.
class Robot
  attr_accessor :name

  @@all_names = ("AA000".."ZZ999").to_a.shuffle!

  def initialize
    name_robot
  end

  def reset
    @@all_names.unshift(name)
    name.clear
    name_robot
  end

  private

  def name_robot
    self.name = @@all_names.pop
  end
end
