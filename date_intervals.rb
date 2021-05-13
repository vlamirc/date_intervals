$LOAD_PATH << File.dirname(__FILE__)

require 'src/input_data'
require 'src/limits'
require 'src/intervals'

input = InputData.new
input.input_from_file(ARGV[0])

limits = Limits.new(input)
intervals = Intervals.new(limits)

puts intervals.pretty_json
