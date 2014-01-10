# Imagine an ATM with ONLY $5 notes. It accepts a single parameter - amount.
# Return false if the amount cannot be given in $5 notes (eg. 23, 36).
# Otherwise, return an array of notes - eg. withdraw(15) would return [5, 5, 5]
# NOTES:
# Modulus operator (%) gets the remainder. So, 5 % 2 = 1 (five divided by two has a remainder of 1)
# Arrays: [] defines an empty array.
# Shover operator (<<) adds to an array. Eg:
# my_array = []
# my_array << 5
# my_array << 7
# my_array.inspect # (prints out [5, 7])

def withdraw(amount)
  if amount <= 0 # this deals with some of the situations...
    return false
  end
  if amount % 5 > 0
    return false
  else
    result = []
    num_notes = amount / 5
    num_notes.times { result << 5 }
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
    [1, false],
    [43, false],
    [20, [5, 5, 5, 5]],
    [35, [5, 5, 5, 5, 5, 5, 5]],
  ].each do |input, expected|
    it "should return #{expected} when $#{input} is withdrawn" do
      withdraw(input).must_equal expected
    end
  end
end
