# Imagine the ATM contains $50 and $20 notes, and refine your function accordingly.
# Eg. withdraw(90) would return [50, 20, 20]

def withdraw(amount)
  denoms = [50, 20]
  if amount <= 0 # this deals with some of the situations...
    return false
  end
  result = []
  remainder = amount
  denoms.each do |denom|
    num_notes = remainder / denom
    num_notes.times { result <<  denom }
    remainder = remainder % denom
  end

  total = 0
  result.each { |denom| total += denom }
  if total == amount
    return result
  else
    return false
  end
end

require './step4_tests.rb'