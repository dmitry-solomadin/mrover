class Rover
  attr_accessor :x, :y, :direction

  def initialize(x, y, direction)
    @x = Integer(x)
    @y = Integer(y)
    raise ArgumentError('Invalid direction') unless validate_direction(direction)
    @direction = direction
  end

  def execute_command_line(commands)
    commands.each_char { |c| execute_command(c) }
  end

  def execute_command(command)
    raise ArgumentError('Invalid rover command') unless validate_command(command)
    # TODO: execute command
  end

private

  def validate_direction(direction)
    direction == 'N' || direction == 'E' || direction == 'S' || direction == 'W'
  end

  def validate_command(command)
    command == 'M' || command == 'R' || command == 'L'
  end

end