# Imagine an ATM with ONLY $5 notes. It accepts a single parameter - amount.
# Return false if the amount cannot be given in $5 notes (eg. 23, 36).
# Otherwise, return an array of notes - eg. atm(15) would return [5, 5, 5]
# NOTES:
# Modulus operator (%) gets the remainder. So, 5 % 2 = 1 (five divided by two has a remainder of 1)
# Arrays: [] defines an empty array.
# Shover operator (<<) adds to an array. Eg:
# my_array = []
# my_array << 5
# my_array << 7
# my_array.inspect # (prints out [5, 7])

def atm(amount)
  if amount <= 0 # this deals with some of the situations...
    return false
  end
  if amount % 5 > 0
    return false
  else
    result = []
    num_notes = amount / 5
    num_notes.times { result << 5 }
    return result
  end
end

require './step1_tests.rb'
