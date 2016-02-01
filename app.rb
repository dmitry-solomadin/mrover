require_relative "field"
require_relative "rover"

class Application

  def execute
    contents = File.read('input')
    puts "Input is:\n\n"
    puts contents

    puts "\nReading... Parsed Data:\n"
    parsed_input = parse_command_lines(contents)
    puts parsed_input.inspect

    @field = Field.new(parsed_input[:field_dimensions][:w], parsed_input[:field_dimensions][:h])
    @rovers = []
    parsed_input[:rovers].each do |rover_input|
      @rovers << Rover.new(rover_input[:x], rover_input[:y], rover_input[:direction])
    end
  end

  def parse_command_lines(input)
    parsed_input = {}
    command_lines = input.split("\n").delete_if &:empty?

    # parse field dimensions
    first_command_line = command_lines[0].split
    parsed_input[:field_dimensions] = { w: first_command_line[0], h: first_command_line[1] }
    command_lines.delete_at(0)

    # parse rovers
    parsed_input[:rovers] = []
    command_lines.each_slice(2) do |rover_commands|
      position = rover_commands[0].split
      parsed_input[:rovers] << { x: position[0], y: position[1], direction: position[2],
                                 commands: rover_commands[1] }
    end
    parsed_input
  end

end

Application.new.execute