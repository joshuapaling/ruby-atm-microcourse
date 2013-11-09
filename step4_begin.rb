# Imagine the ATM contains $20, $10 and $5 notes, and refine your function accordingly.
# Eg. withdraw(45) would return [20, 20, 5]
#
# TIPS
# to tell if an array is empty: my_array.empty?
# to tell if an array is not empty: !my_array.empty?
# to remove the first element of an array: my_array.shift
# If your function calls a sub-function, keep in mind
# Ruby has no concept of 'pass by value'. Variables are always a reference to an object.
#
def withdraw(amount)
  if amount <= 0 # this deals with some of the situations...
    return false
  end
  # ToDo: figure out this bit
  return []
end

require './step4_tests.rb'