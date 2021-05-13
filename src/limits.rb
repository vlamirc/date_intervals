require 'date'

class MalformedDateStringError < StandardError; end
class DateOutOfSequenceError < StandardError; end
class InvalidDayError < StandardError; end
class InvalidMonthError < StandardError; end
class InvalidFirstDateError < StandardError; end
class InvalidYearError < StandardError; end

# class Limits
# --
class Limits
  def initialize(input_data)
    @dates = []
    input_data.array_of_strings.each do |date_string|
      @dates << check_date(date_string)
      @prev_date = @dates.last
    end
  end

  def check_date(date_string)
    date_parts = date_string.split
    raise MalformedDateStringError.new "Malformed date string: #{date_string}" if date_parts.size < 2 || date_parts.size > 3

    check_day(date_parts[0])
    check_month(date_parts[1])
    year = check_and_set_year(date_parts[2], date_string)

    date = Date.parse(date_string + year, false)
    raise DateOutOfSequenceError.new "Date out of sequence: #{date}" if defined?(@prev_date) && date <= @prev_date

    date
  end

  def check_day(day)
    raise InvalidDayError.new "Invalid day: #{day}" if day.to_i < 1 || day.to_i > 31
  end

  def check_month(month)
    raise InvalidMonthError.new "Invalid month: #{month}" unless Date::ABBR_MONTHNAMES.include? month
  end

  def check_and_set_year(year, date_string)
    if year.nil?
      raise InvalidFirstDateError.new 'Invalid first date' unless defined?(@prev_date)

      next_year(@prev_date, date_string)
    else
      raise InvalidYearError.new "Invalid year: #{year}" if year.to_i < 1

      ''
    end
  end

  def next_year(prev_date, date_string_without_year)
    year = prev_date.year
    next_date = nil

    loop do
      next_date = Date.parse("#{date_string_without_year} #{year}")
      break if next_date > prev_date

      year += 1
    end

    next_date.year.to_s
  end

  def array_of_dates
    @dates
  end
end
