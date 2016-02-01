class Field
  attr_accessor :rovers

  def initialize(w, h)
    @w = w
    @h = h
  end

  def add_rover(rover)
    @rovers ||= []
    raise ArgumentError.new('Incorrect initial rover position') unless validate_rover_position(rover)
    @rovers << rover
  end

  def execute_rover(index, commands)
    @rovers[index].execute_command_line commands
    raise ArgumentError.new('Incorrect resulting rover position') unless validate_rover_position(@rovers[index])
  end

private

  def validate_rover_position(rover)
    rover.x > 0 && rover.y > 0 && rover.x <= @w && rover.y <= @h
  end

end