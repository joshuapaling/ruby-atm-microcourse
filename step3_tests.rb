
require 'minitest/spec'
require 'minitest/autorun'

describe 'atm' do
  [
    [-1, false],
    [0, false],
    [7, false],
    [20, [10, 10]],
    [25, [10, 10, 5]],
    [35, [10, 10, 10, 5]],
  ].each do |input, expected|
    it "should convert the number #{input} to #{expected}" do
      withdraw(input).must_equal expected
    end
  end
end