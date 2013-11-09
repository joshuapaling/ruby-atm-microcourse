
require 'minitest/spec'
require 'minitest/autorun'

describe 'atm' do
  [
    [-1, [20, 10], false],
    [0, [20, 10], false],
    [7, [20, 10], false],
    [45, [50, 20, 10, 5], [20, 20, 5]],
    [65, [50, 20, 10, 5], [50, 10, 5]],
    [65, [50, 20, 5], [50, 5, 5, 5]], # Note: an alternative solution here would be [20, 20, 20, 5]
    [80, [50, 20, 5], [50, 20, 5, 5]],
    [130, [100, 50, 20, 10, 5], [100, 20, 10]],
  ].each do |amount, denoms, expected|
    it "should convert the number #{amount} with #{denoms} to #{expected}" do
      withdraw(amount, denoms).must_equal expected
    end
  end
end