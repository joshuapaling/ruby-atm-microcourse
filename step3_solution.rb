# Imagine the ATM contains $10 and $5 notes, and refine your function accordingly.
# Eg. withdraw(25) would return [10, 10, 5]
# TIPS
# the 'floor' method rounds a float down. Eg. 2.8.floor # returns 2


def withdraw(amount)
  if amount <= 0 # this deals with some of the situations...
    return false
  end
  if amount % 5 > 0
    return false
  else
    # we can definitely return a result!
    result = []
    ten_count = (amount / 10).floor
    remainder = amount % 10
    five_count = (remainder / 5).floor
    ten_count.times { result << 10 }
    five_count.times { result << 5 }
    return result
  end
end

require './step3_tests.rb'
