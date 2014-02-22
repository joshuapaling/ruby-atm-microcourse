# Imagine an ATM with ONLY $5 notes. It accepts a single parameter - amount.
# Return true if the amount can be given in $5 notes (eg. 25, 15, etc).
# Otherwise, return false

def withdraw(amount)
  note_available = 5
  if amount <= 0 # this deals with some of the situations...
    return false
  elsif amount % note_available > 0
    return false
  else
    return true
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
    [17, false],
    [5, true],
    [20, true],
    [35, true],
  ].each do |input, expected|
    it "should return #{expected} when $#{input} is withdrawn" do
      withdraw(input).must_equal expected
    end
  end
end
