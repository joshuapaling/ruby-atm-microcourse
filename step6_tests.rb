
require 'minitest/spec'
require 'minitest/autorun'

describe 'atm' do
  [
    [-1, [20, 10], false],
    [0, [100, 50, 20], false],
    [50, [100, 20], false],
    [120, [50, 10, 5], [50, 50, 10, 10]],
    [65, [50, 20, 10, 5], [50, 10, 5]],
    [80, [50, 20, 5], [50, 20, 5, 5]],
    [130, [100, 50, 20, 10, 5], [100, 20, 10]],
    [160, [50, 20], [50, 50, 20, 20, 20]],
  ].each do |amount, denoms, expected|
    it "should convert the number #{amount} with #{denoms} to #{expected}" do
      withdraw(amount, denoms).must_equal expected
    end
  end
end