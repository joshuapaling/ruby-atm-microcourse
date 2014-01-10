# Imagine the ATM contains $10 and $5 notes, and refine your function accordingly.
# Eg. withdraw(25) would return [10, 10, 5]
# TIPS
# the 'floor' method rounds a float down. Eg. 2.8.floor # returns 2


def withdraw(amount)
  if amount <= 0 # this deals with some of the situations...
    return false
  end
  if amount % 5 > 0
    return false
  else
    # we can definitely return a result!
    result = []
    ten_count = (amount / 10).floor
    remainder = amount % 10
    five_count = (remainder / 5).floor
    ten_count.times { result << 10 }
    five_count.times { result << 5 }
    return result
  end
end

# import required testing libraries
require 'minitest/spec'
require 'minitest/autorun'

# BELOW ARE THE TESTS FOR AUTOMATICALLY CHECKING YOUR SOLUTION.
# THESE NEED TO BE REPLACED AFTER EACH STEP.
describe 'atm' do
  [
    [-1, false],
    [0, false],
    [7, false],
    [20, [10, 10]],
    [25, [10, 10, 5]],
    [35, [10, 10, 10, 5]],
  ].each do |input, expected|
    it "should return #{expected} when $#{input} is withdrawn" do
      withdraw(input).must_equal expected
    end
  end
end
