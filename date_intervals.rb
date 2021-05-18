$LOAD_PATH << File.dirname(__FILE__)

require 'src/input_data'
require 'src/limits'
require 'src/intervals'

input = InputData.new
input.input_from_file(path: ARGV[0])

limits = Limits.new(input: input)
intervals = Intervals.new(limits: limits)

puts intervals.pretty_json
