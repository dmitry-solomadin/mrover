require_relative "parser"
require_relative "field"
require_relative "rover"

class Application

  def execute
    debug = ARGV[1] || false
    unless ARGV[0]
      puts "Please provide input file path as first argument"
      return
    end

    contents = File.read(ARGV[0])
    if debug
      puts "Input is:\n\n"
      puts contents
    end

    puts "\nReading... Parsed Data:\n" if debug
    parsed_input = Parser.parse(contents)
    puts parsed_input.inspect if debug

    @field = Field.new(parsed_input[:field_dimensions][:w], parsed_input[:field_dimensions][:h])
    parsed_input[:rovers].each do |rover_input|
      @field.add_rover Rover.new(rover_input[:x], rover_input[:y], rover_input[:direction])
    end

    @field.rovers.each_with_index do |_rover, index|
      @field.execute_rover(index, parsed_input[:rovers][index][:commands])
    end

    @field.rovers.each { |rover| puts rover.to_s }
  rescue ArgumentError => e
    puts "Can't resolve with input data"
    puts "Reason: #{e.message}"
    puts "Quitting"
  end

end

Application.new.execute