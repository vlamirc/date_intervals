RSpec.describe Limits do
  context 'with good input' do
    before(:all) do
      good_input
      input = InputData.new
      input.input_from_string(@good_input)
      @limits = Limits.new(input)
    end

    it do
      expect(@limits).to respond_to(:array_of_dates).with(0).argument
    end

    it 'should return correct array of dates' do
      expect(@limits.array_of_dates).to eq(@good_array_of_dates)
    end
  end

  context 'with bad input' do
    before(:all) do
      bad_input
    end

    before do
      @input = InputData.new
    end

    it 'should raises exception (Malformed date string)' do
      @input.input_from_string(@bad_input_1)
      expect { Limits.new(@input) }.to raise_error(MalformedDateStringError)
    end

    it 'should raises exception (Invalid month)' do
      @input.input_from_string(@bad_input_2)
      expect { Limits.new(@input) }.to raise_error(InvalidMonthError)
    end

    it 'should raises exception (Invalid day)' do
      @input.input_from_string(@bad_input_3)
      expect { Limits.new(@input) }.to raise_error(InvalidDayError)
    end

    it 'should raises exception (Date out of sequence)' do
      @input.input_from_string(@bad_input_4)
      expect { Limits.new(@input) }.to raise_error(DateOutOfSequenceError)
    end

    it 'should raises exception (Invalid first date)' do
      @input.input_from_string(@bad_input_5)
      expect { Limits.new(@input) }.to raise_error(InvalidFirstDateError)
    end

    it 'should raises exception (Invalid year)' do
      @input.input_from_string(@bad_input_6)
      expect { Limits.new(@input) }.to raise_error(InvalidYearError)
    end
  end

  def good_input
    @good_input = '"11 Aug 2020","29 Jan","27 Jan","1 Dec 2022","28 Jan"'
    @good_array_of_strings = ['11 Aug 2020', '29 Jan', '27 Jan', '1 Dec 2022', '28 Jan']
    @good_array_of_dates = [
      Date.parse('11 Aug 2020'),
      Date.parse('29 Jan 2021'),
      Date.parse('27 Jan 2022'),
      Date.parse('1 Dec 2022'),
      Date.parse('28 Jan 2023')
    ]
  end

  def bad_input
    @bad_input_1 = '"11 Aug 2020""29 Jan","27 Jan","1 Dec 2022","28 Jan"'
    @bad_input_2 = '"11 2020","29 Jan","27 Jan","1 Dec 2022","28 Jan"'
    @bad_input_3 = '"33 Aug 2020","29 Jan","27 Jan","1 Dec 2022","28 Jan"'
    @bad_input_4 = '"11 Aug 2020","29 Jan","27 Jan","1 Dec 2021","28 Jan"'
    @bad_input_5 = '"11 Aug","29 Jan","27 Jan","1 Dec 2022","28 Jan"'
    @bad_input_6 = '"11 Aug xxxx","29 Jan","27 Jan","1 Dec 2022","28 Jan"'
  end
end
