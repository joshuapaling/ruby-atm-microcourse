# Imagine the ATM contains $20, $10 and $5 notes, and refine your function accordingly.
# Eg. withdraw(45) would return [20, 20, 5]
#
# TIPS
# to tell if an array is empty: my_array.empty?
# to tell if an array is not empty: !my_array.empty?
# to remove the first element of an array: my_array.shift
# If your function calls a sub-function, keep in mind
# Ruby has no concept of 'pass by value'. Variables are always a reference to an object.

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

require './step4_tests.rb'