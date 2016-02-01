class Rover
  attr_accessor :x, :y, :direction

  DIRECTIONS = ['N', 'E', 'S', 'W']

  def initialize(x, y, direction)
    @x = Integer(x)
    @y = Integer(y)
    raise ArgumentError.new('Invalid direction') unless validate_direction(direction)
    @direction = direction
  end

  def execute_command_line(commands)
    commands.each_char { |c| execute_command(c) }
  end

  def execute_command(command)
    raise ArgumentError.new('Incorrect command') unless validate_command(command)
    if command == 'L'
      change_direction(right: false)
    elsif command == 'R'
      change_direction(right: true)
    elsif command == 'M'
      move
    end
  end

private

  def move
    @y = @y + 1 if @direction == 'N'
    @y = @y - 1 if @direction == 'S'
    @x = @x + 1 if @direction == 'E'
    @x = @x - 1 if @direction == 'W'
  end

  def change_direction(right:)
    DIRECTIONS.each_with_index do |d, i|
      index = right ? i + 1 : i - 1
      index = index < 0 ? 3 : (index > 3 ? 0 : index)
      if @direction == d
        @direction = DIRECTIONS[index]
        break
      end
    end
  end

  def validate_direction(direction)
    direction == 'N' || direction == 'E' || direction == 'S' || direction == 'W'
  end

  def validate_command(command)
    command == 'M' || command == 'R' || command == 'L'
  end

end