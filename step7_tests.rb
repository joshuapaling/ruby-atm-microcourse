
require 'minitest/spec'
require 'minitest/autorun'

describe 'atm' do
  [
    [-1, [23, 4], false],
    [0, [2, 18], false],
    [193, [97, 20, 5], false],
    [7, [3, 4], [4, 3]],
    [68, [23, 41, 9], [41, 9, 9, 9]],
    [101, [13, 29, 17], [29, 29, 17, 13, 13]],
    [157, [50, 14, 29], [50, 50, 29, 14, 14]],
    [158, [50, 14, 29], [50, 50, 29, 29]],
    [159, [50, 14, 29], [29, 29, 29, 29, 29, 14]],
    [195, [43, 104, 5], [104, 43, 43, 5]],
  ].each do |amount, denoms, expected|
    it "should convert the number #{amount} with #{denoms} to #{expected}" do
      withdraw(amount, denoms).must_equal expected
    end
  end
end
