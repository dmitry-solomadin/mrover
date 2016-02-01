require_relative "parser"
require_relative "field"
require_relative "rover"

class Application

  def execute
    unless ARGV[0]
      puts "Please provide input file path as first argument"
      return
    end

    contents = File.read(ARGV[0])
    puts "Input is:\n\n"
    puts contents

    puts "\nReading... Parsed Data:\n"
    parsed_input = Parser.parse(contents)
    puts parsed_input.inspect

    @field = Field.new(parsed_input[:field_dimensions][:w], parsed_input[:field_dimensions][:h])
    @rovers = []
    parsed_input[:rovers].each do |rover_input|
      @rovers << Rover.new(rover_input[:x], rover_input[:y], rover_input[:direction])
    end
  rescue ArgumentError
    puts "Can't read input data. Quitting..."
  end

end

Application.new.execute