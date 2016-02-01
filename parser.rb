class Parser

  def self.parse(input)
    parsed_input = {}
    command_lines = input.split("\n").delete_if &:empty?

    raise ArgumentError.new('Incorrect input - # of lines') if command_lines.size % 2 == 0

    # parse field dimensions
    first_command_line = command_lines[0].split
    raise ArgumentError.new('Incorrect input - field dimensions') if first_command_line.size < 2
    parsed_input[:field_dimensions] = { w: Integer(first_command_line[0]), h: Integer(first_command_line[1]) }
    command_lines.delete_at(0)

    # parse rovers
    parsed_input[:rovers] = []

    command_lines.each_slice(2) do |rover_commands|
      position = rover_commands[0].split
      raise ArgumentError.new('Incorrect input - rover position/heading') if position.size < 3
      parsed_input[:rovers] << { x: Integer(position[0]), y: Integer(position[1]), direction: position[2],
                                 commands: rover_commands[1] }
    end
    parsed_input
  end

end