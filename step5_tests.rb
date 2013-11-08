
require 'minitest/spec'
require 'minitest/autorun'

describe 'atm' do
  [
    [-1, false],
    [0, false],
    [7, false],
    [40, [20, 20]],
    [70, [50, 20]],
    [140, [50, 50, 20, 20]],
  ].each do |input, expected|
    it "should convert the number #{input} to #{expected}" do
      withdraw(input).must_equal expected
    end
  end
end