# Imagine you're able to pass in a second parameter, an array,
# specifying the denominations of Australian note available for withdrawal.
# eg. the second parameter might be [100, 20, 5], or [50, 20, 10], or something like that

def withdraw(amount, denoms)
  if amount <= 0 # this deals with some of the situations...
    return false
  end
  # ToDo: figure out this bit
  return []
end

require './step6_tests.rb'