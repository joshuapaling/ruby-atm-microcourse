# Imagine the ATM contains only $10 notes, and refine your function accordingly.

def withdraw(amount)
  denomination = 10
  if amount <= 0 # this deals with some of the situations...
    return false
  end
  if amount % denomination > 0
    return false
  else
    result = []
    num_notes = amount / denomination
    num_notes.times { result << denomination }
    return result
  end
end

require './step2_tests.rb'