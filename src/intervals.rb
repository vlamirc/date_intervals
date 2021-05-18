require 'json'

# class Intervals
# --
class Intervals
  def initialize(limits:)
    @dates = limits.array_of_dates
    @ranges = @intervals = []
    set_ranges
    set_intervals
  end

  def pretty_json
    JSON.pretty_generate(@ranges)
  end

  private

  def set_ranges
    @dates.each_index do |i|
      @ranges << { interval: i + 1, start: @dates[i], end: @dates[i + 1] } unless @dates[i + 1].nil?
    end
  end

  def set_intervals
    @ranges.each do |range|
      date = range[:start] + 1
      dates = []
      while date < range[:end]
        dates << date
        date += 1
      end
      range[:dates] = dates
    end
  end
end
