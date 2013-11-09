# Imagine the ATM allows a second parameter, an array, containing the possible denominations of note to allow
# eg. withdraw(65, [50, 20, 5]) would return [20, 20, 20, 5]

def withdraw(amount, denoms)
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
    num_notes = remainder / denom
    num_notes.times { result << denom }
    remainder = remainder % denom
  end

  if remainder > 0
    result = false
  end

  return result
end

require './step5_tests.rb'