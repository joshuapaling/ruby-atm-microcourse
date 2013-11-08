
require 'minitest/spec'
require 'minitest/autorun'

describe 'atm' do
  [
    [-1, false],
    [0, false],
    [7, false],
    [45, false],
    [20, [10, 10]],
    [40, [10, 10, 10, 10]],
  ].each do |input, expected|
    it "should convert the number #{input} to #{expected}" do
      atm(input).must_equal expected
    end
  end
end