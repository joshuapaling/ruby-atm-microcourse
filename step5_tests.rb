
require 'minitest/spec'
require 'minitest/autorun'

describe 'atm' do
  [
    [-1, false],
    [0, false],
    [7, false],
    [135, false],
    [70, [50, 20]],
    [80, [20, 20, 20, 20]],
    [90, [50, 20, 20]],
    [120, [50, 50, 20]],
    [130, [50, 20, 20, 20, 20]],
    [160, [50, 50, 20, 20, 20]]
  ].each do |amount, expected|
    it "should convert the number #{amount} to #{expected}" do
      withdraw(amount).must_equal expected
    end
  end
end