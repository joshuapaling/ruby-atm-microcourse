# Imagine an ATM with ONLY $5 notes. It accepts a single parameter - amount.
# Return false if the amount cannot be given in $5 notes (eg. 23, 36).
# Otherwise, return the correct number of notes - eg. withdraw(15) would return 3

def withdraw(amount)
  if amount <= 0 # this deals with some of the situations...
    return false
  elsif amount % 5 > 0
    return false
  else
    return amount / 5
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
    [1, false],
    [43, false],
    [7, false],
    [5, 1],
    [20, 4],
    [35, 7],
  ].each do |input, expected|
    it "should return #{expected} when $#{input} is withdrawn" do
      withdraw(input).must_equal expected
    end
  end
end
