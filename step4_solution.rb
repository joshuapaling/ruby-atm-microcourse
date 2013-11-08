# Imagine the ATM contains $50 and $20 notes, and refine your function accordingly.
# Eg. withdraw(90) would return [50, 20, 20]
#
# TIPS
# to tell if an array is empty: my_array.empty?
# to tell if an array is not empty: !my_array.empty?
# to remove the first element of an array: my_array.shift
# If your function calls a sub-function, keep in mind
# Ruby has no concept of 'pass by value'. Variables are always a reference to an object.

def withdraw(amount)
  denoms = [50, 20]
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

require './step4_tests.rb'