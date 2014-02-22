# Imagine the ATM contains only $10 notes, and refine your function accordingly.

def withdraw(amount)
  denomination = 10
  if amount <= 0 # this deals with some of the situations...
    return false
  end
  if amount % denomination > 0
    return false
  else
    result = []
    num_notes = amount / denomination
    num_notes.times { result << denomination }
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
    [45, false],
    [20, [10, 10]],
    [40, [10, 10, 10, 10]],
  ].each do |input, expected|
    it "should return #{expected} when $#{input} is withdrawn" do
      withdraw(input).must_equal expected
    end
  end
end