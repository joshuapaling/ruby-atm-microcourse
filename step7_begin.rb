# Imagine you're second parameter now has to handle ANY, bizarre,
# non-round denominations. eg, $23, $14, and $9 notes.
# And imagine you can pass them in any order - eg. [14, 23, 9]
# TIPS:
# my_array.sort will sort a numeric array in ascending order.
# my_array.reverse will reverse the direction of that array.

def withdraw(amount, denoms)
  if amount <= 0 # this deals with some of the situations...
    return false
  end
  # ToDo: figure out this bit
  return []
end

require './step7_tests.rb'