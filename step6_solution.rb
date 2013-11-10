# Imagine you're able to pass in a second parameter, an array,
# specifying the denominations of Australian note available for withdrawal.
# eg. the second parameter might be [100, 20, 5], or [50, 20, 10], or something like that

def withdraw(amount, denoms)
  if amount <= 0 # this deals with some of the situations...
    return false
  end
  return try_top_denom_variations(amount, denoms)
end

# find the max times the highest denomination will fit into the
# requested amount. Try every variation of the top denomination,
# from the max possible, down to zero, and see if the remaining
# amount can be made up evenly by the remaining denominations.
# Return once we get a successful result, or once we've tried all
# variations unsuccessfully.
def try_top_denom_variations(amount, denoms)
  result = false
  if denoms.count == 1
    # There's no more denominations to try with.
    # We're at the lowest denomination we have
    return try_with_single_denom(amount, denoms.first)
  else
    top_denom = denoms.first
    top_denom_count = (amount / top_denom).floor
    denoms.shift
    while top_denom_count >= 0 && !result && denoms.count
      remainder = amount - top_denom_count * top_denom
      result = try_top_denom_variations(remainder, denoms)
      if result
        # add the correct number of the top denomination onto the front of the results array.
        top_denom_count.times { result.unshift(top_denom) }
      end
      top_denom_count = top_denom_count - 1
    end
    return result
  end
end

def try_with_single_denom(amount, denom)
    remainder = amount % denom
    if remainder > 0
      result = false
    else
      result = []
      num_notes = amount / denom
      num_notes.times { result << denom }
    end
    return result
end

require './step6_tests.rb'