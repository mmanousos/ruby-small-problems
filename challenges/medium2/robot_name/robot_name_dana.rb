class SerialCode
  SerialCodeOverflowError = Class.new(StandardError)

  def initialize
    @serial = 'AA000'
  end

  def generate
    name = @serial.dup
    fail SerialCodeOverflowError, "Maximum serials created" if name == 'ZZ999'
    @serial.next!
    name
  end
end

class Robot
  attr_reader :name

  class << self; attr_reader :serial_generator end
  @serial_generator = SerialCode.new

  def initialize
    @name = Robot.serial_generator.generate
  end

  def reset
    @name = Robot.serial_generator.generate
  end
end
