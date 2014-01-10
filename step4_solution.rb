# Imagine the ATM contains $20, $10 and $5 notes, and refine your function accordingly.
# Eg. withdraw(45) would return [20, 20, 5]

def withdraw(amount)
  denoms = [20, 10, 5]
  if amount <= 0 # this deals with some of the situations...
    return false
  end
  remainder = amount
  result = false
  until result || denoms.empty? do
    result = try_with_denoms(amount, denoms)

    if !result
      # remove the highest denomination, and we'll try again next loop
      # eg. if withdraw(70) failed, remove 50 notes, and try with only 20's
      denoms.shift
    end
  end

  return result

end

def try_with_denoms(amount, denoms)
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