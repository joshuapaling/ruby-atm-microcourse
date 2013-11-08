# Imagine an ATM with ONLY $5 notes. The function accepts a single parameter - amount.
# Return false if the amount cannot be given in $5 notes (eg. 23 or 36).
# Otherwise, return an array of notes - eg. withdraw(15) would return [5, 5, 5]
# TIPS:
# Modulus operator (%) gives the remainder. So, 5 % 2 = 1 (five divided by two has a remainder of 1)
# Arrays: [] defines an empty array.
# Shover operator (<<) adds to an array. Eg:
# my_array = []
# my_array << 5
# my_array << 7
# my_array.inspect # (prints out [5, 7])
#
# times method:
# 3.times { do_something }
# will call do_something 3 times!

def withdraw(amount)
  if amount <= 0 # this deals with some of the situations...
    return false
  end
  # ToDo: figure out this bit
  return []
end

require './step1_tests.rb'
