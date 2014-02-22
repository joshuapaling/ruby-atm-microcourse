# Imagine the ATM contains $20, $10 and $5 notes, and refine your function accordingly.
# Eg. withdraw(45) would return [20, 20, 5]

def withdraw(amount)
  denoms = [20, 10, 5]
  if amount <= 0 # this deals with some of the situations...
    return false
  end

  result = []
  remainder = amount
  denoms.each do |denom|
    num_notes = (remainder / denom).floor
    num_notes.times { result << denom }
    remainder = remainder % denom
  end

  if remainder > 0
    result = false
  end

  return result

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
    [53, false],
    [35, [20, 10, 5]],
    [40, [20, 20]],
    [65, [20, 20, 20, 5]],
    [70, [20, 20, 20, 10]],
    [75, [20, 20, 20, 10, 5]],
  ].each do |input, expected|
    it "should return #{expected} when $#{input} is withdrawn" do
      withdraw(input).must_equal expected
    end
  end
end