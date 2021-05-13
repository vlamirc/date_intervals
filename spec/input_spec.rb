RSpec.describe InputData do
  context 'with good input' do
    before(:all) do
      good_input
    end

    it 'should return correct array of date strings' do
      input = InputData.new
      input.input_from_string(@good_input)
      expect(input.array_of_strings).to eq(@good_array_of_strings)
    end
  end

  context 'with bad input' do
    before(:all) do
      bad_input
    end

    it 'should not return correct array of date strings' do
      input = InputData.new
      input.input_from_string(@bad_input_1)
      expect(input.array_of_strings).to_not eq(@good_array_of_strings)
    end
  end

  def good_input
    @good_input = '"11 Aug 2020","29 Jan","27 Jan","1 Dec 2022","28 Jan"'
    @good_array_of_strings = ['11 Aug 2020', '29 Jan', '27 Jan', '1 Dec 2022', '28 Jan']
  end

  def bad_input
    @bad_input_1 = '"11 Aug 2020""29 Jan","27 Jan","1 Dec 2022","28 Jan"'
    @bad_input_2 = '"11 2020","29 Jan","27 Jan","1 Dec 2022","28 Jan"'
  end
end
