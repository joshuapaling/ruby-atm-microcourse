# Imagine the ATM has only $50 and $20 denominations. Modify your solution to accommodate this.
# Hint: before coding, consider the case of withdrawing $160.
# What should the result be? What about withdrawing $130?

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
      # eg. if withdraw(60) failed, remove 50 notes, and try with only 20's
      denoms.shift
    end
  end

  return result
end

def try_with_denoms(amount, denoms)
  result = []
  remainder = amount
  denoms.each do |denom|
    num_notes = (remainder / denom).floor
    num_notes.times { result << denom }
    remainder = remainder % denom
  end

  if remainder == 0
    return result
  else
    # DON'T return false straight away here - Eg.
    # withdraw(160) will fail b/c it will try to give 3 * $50,
    # and the remainder is $10, which isn't available.
    # We need logic that will try and return 2*$50, and 3*$20
    # So, reduced the number of highest-denomination notes used by one,
    # and re-try filling the remainder with smaller notes.
    # If we fail, reduce by one again, until the count of highest denomination
    # notes is zero

    if denoms.count == 1
      result = false # There's no more denominations to try with.
    else
      top_denom = denoms.first
      top_denom_count = (amount / top_denom).floor
      denoms.shift
      while top_denom_count > 0 || result == false
        top_denom_count = top_denom_count - 1
        remainder = amount - top_denom_count * top_denom
        puts "about to try with #{remainder.to_s} and #{denoms.to_s}"
        result = try_with_denoms(remainder, denoms)
        if result
          top_denom_count.times { result.unshift(top_denom) }
          return result
        end
      end
      return try_with_denoms(amount, denoms)
    end
  end
end

require './step5_tests.rb'