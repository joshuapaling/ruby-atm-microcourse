
require 'minitest/spec'
require 'minitest/autorun'

describe 'atm' do
  [
    [-1, false],
    [0, false],
    [1, false],
    [43, false],
    [20, [5, 5, 5, 5]],
    [35, [5, 5, 5, 5, 5, 5, 5]],
  ].each do |input, expected|
    it "should convert the number #{input} to #{expected}" do
      atm(input).must_equal expected
    end
  end
end