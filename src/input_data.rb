require 'csv'

# class Dates
# --
class InputData
  def initialize
    @date_array = []
  end

  def input_from_file(path)
    File.open(path) do |file|
      csv_parse(file)
    end
  end

  def input_from_string(string)
    csv_parse(string)
  end

  def array_of_strings
    @date_array
  end

  private

  def csv_parse(input)
    csv = CSV.parse_line(input)

    csv.each do |date_string|
      @date_array << date_string
    end
  end
end
