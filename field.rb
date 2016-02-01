class Field
  attr_accessor :rovers

  def initialize(w, h)
    @w = w
    @h = h
  end

  def add_rover(rover)
    @rovers ||= []
    @rovers << rover
  end

  def execute_rover(index, commands)
    @rovers[index].execute_command_line commands
  end
end