require 'json'

RSpec.describe Intervals do
  context 'with good input' do
    before(:all) do
      good_input
    end

    it 'should return correct Json' do
      input = InputData.new
      input.input_from_string(@good_input)
      limits = Limits.new(input)
      intervals = Intervals.new(limits)
      array = JSON.parse(intervals.pretty_json)
      expect(array.size).to eq(4)
      expect(array[0]['interval']).to eq(1)
      expect(array[0]['start']).to eq('2020-08-11')
      expect(array[0]['end']).to eq('2021-01-29')
      expect(array[3]['interval']).to eq(4)
      expect(array[3]['start']).to eq('2022-12-01')
      expect(array[3]['end']).to eq('2023-01-28')
    end
  end

  def good_input
    @good_input = '"11 Aug 2020","29 Jan","27 Jan","1 Dec 2022","28 Jan"'
  end
end
