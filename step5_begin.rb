# Imagine the ATM allows a second parameter, an array, containing the denominations of note to allow
# eg. withdraw(65, [50, 20, 5]) would return [20, 20, 20, 5]

def withdraw(amount, denoms)
  if amount <= 0 # this deals with some of the situations...
    return false
  end
  # ToDo: figure out this bit
  return []
end

require './step5_tests.rb'