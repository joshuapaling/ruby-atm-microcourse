# atm.rb

def atm(number)
  if number <= 0 # this deals with some of the situations...
    return []
  end
  # TODO: figure out this bit!
  return []
end

# ----------------------------------------------------------------------
# Run some tests to check to see if you're right.
#
# To run the file,
# - if you are using Sublime, press Ctrl+B
# - if you are using a command prompt, enter:
#
#    ruby atm.rb
#
# You will see output that tells you if you got it right:
#
# E means error, F means failure, . means correct.
#
# The tests are run in a random order each time.

require 'minitest/spec'
require 'minitest/autorun'

describe 'atm' do
  [
    [-1, []],
    [0, []],
    [1, []],
    [20, [20]],
    [40, [20, 20]],
    [50, [50]],
    [60, [20, 20, 20]],
    [80, [50, 20]],
  ].each do |input, expected|
    it "should convert the number #{input} to #{expected}" do
      atm(input).must_equal expected
    end
  end
end