class Robot
  attr_reader :coordinates

  DIRECTIONS = [:north, :east, :south, :west]

  def orient(direction)
    invalid_direction = "#{direction} is an unsupported direction."
    raise ArgumentError, invalid_direction if !DIRECTIONS.include?(direction)
    @direction = direction
  end

  def turn_right
    current_index = DIRECTIONS.index(@direction)
    current_index -= 4 if current_index == 3
    @direction = DIRECTIONS[current_index + 1]
  end

  def turn_left
    current_index = DIRECTIONS.index(@direction)
    current_index += 4 if current_index == 0
    @direction = DIRECTIONS[current_index - 1]
  end

  def bearing
    @direction
  end

  def at(x, y)
    @coordinates = [x, y]
  end

  def advance
    case @direction
    when :north then @coordinates[1] += 1
    when :south then @coordinates[1] -= 1
    when :east  then @coordinates[0] += 1
    when :west  then @coordinates[0] -= 1
    end
  end
end

class Simulator
  COMMANDS = {
    'R' => :turn_right,
    'L' => :turn_left,
    'A' => :advance
  }

  def instructions(command)
    command.upcase.split('').map { |letter| COMMANDS[letter] }
  end

  def place(robot, spot)
    robot.at(spot[:x], spot[:y])
    robot.orient(spot[:direction])
  end

  def evaluate(robot, command)
    instructions(command).each { |action| robot.send(action) }
  end
end
