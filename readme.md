# Rails Girls Tutorial: Programming a Ruby ATM

*Created by Joshua Paling, [@joshuapaling](https://twitter.com/joshuapaling)*

We'll be writing a function to handle withdrawing money from an ATM. It will accept an amount, and return either an `array` representing the notes to return, or `false` if that amount cannot be made up of the available notes.

This tutorial consists of 4 steps, and 2 challenge steps. We'll start simple, then add more challenging requirements with each step.

### Workflow
Each step has pre-built tests, which you can use to verify your code works as expected. For each step, you'll take the following actions:

a) Copy the tests for that step into your code, replacing the tests from the previous step.

b) Modify your code, and re-run the tests, until all tests pass. *Note: some steps have tips at the bottom - make sure to read those.*

c) If there are discussion points, spend a few minutes talking about them with your pairing partner.

d) Move on to the next step and repeat.

### To run the tests:

**Using Sublime Text:** With your solution open, Press command-B (Or select Tools -> Build)

**Using console:** `cd /path/to/directory/` and then run `ruby atm.rb` *(assuming your file is called atm.rb)*

### Step 1

Imagine an ATM that holds only $5 notes. Write a function to return an array of $5 notes, for a given amount.

*Eg. 1 `withdraw(15)` should return an array, `[5, 5, 5]`*

*Eg. 2 `withdraw(18)` should return `false`, because $18 cannot be made up of $5 notes*

**Starting Code & Tests:** Create a file called `atm.rb`, and paste the following code into it. This contains the shell of your `withdraw()` function, along with tests. Your task is to modify the code so all tests pass.

```ruby
def withdraw(amount)
  if amount <= 0 # this deals with some of the situations...
    return false
  end
  # ToDo: figure out this bit
  return []
end

# import required testing libraries
require 'minitest/spec'
require 'minitest/autorun'

# BELOW ARE THE TESTS FOR AUTOMATICALLY CHECKING YOUR SOLUTION.
# THESE NEED TO BE REPLACED AFTER EACH STEP.
describe 'atm' do
  [
    [-1, false],
    [0, false],
    [1, false],
    [43, false],
    [20, [5, 5, 5, 5]],
    [35, [5, 5, 5, 5, 5, 5, 5]],
  ].each do |input, expected|
    it "should return #{expected} when $#{input} is withdrawn" do
      withdraw(input).must_equal expected
    end
  end
end
```

** Tips for this step**

The modulus operator, `%` gets the remainder of a division. So, `5 % 2 == 1` is true (five divided by two has a remainder of 1)

`[]` defines an empty array. `[10, 20]` defines an array with two elements (10 and 20)

`<<` the shovel operator adds an element to an array. Eg. `[10, 20] << 30` will add 30 to the array, resulting in `[10, 20, 30]`

the `times` method executes a block of code several times - eg. `5.times { puts 'hello' }` will print 'hello' 5 times.

Bringing it all together:

```ruby
my_array = [] # create an empty array and store it in my_array
my_array << 20 # now my array contains [20]
my_array << 30 # now my_array contains [20, 30]
remainder = 13 % 5 # remainder is 2
remainder.times { my_array << 5 } # now my_array contains [20, 30, 5, 5, 5]
```

### Step 2
Now imagine the ATM returns only $10 notes. Modify your function to accommodate this.

*Eg. 1 `withdraw(20)` should return an array, `[10, 10]`*

*Eg. 2 `withdraw(15)` should return `false`, because $15 cannot be made up of $10 notes*

**Tests:** Replace the tests from the previous step with the tests below, and modify your code until these new tests pass.

```ruby
describe 'atm' do
  [
    [-1, false],
    [0, false],
    [7, false],
    [45, false],
    [20, [10, 10]],
    [40, [10, 10, 10, 10]],
  ].each do |input, expected|
    it "should return #{expected} when $#{input} is withdrawn" do
      withdraw(input).must_equal expected
    end
  end
end
```

### Step 1/2 Discussion Points
* How many lines did you have to change? What if we now restricted it to another single denomination (eg. $20 notes)? How many lines would you have to change this time?
* Refactor your code so such that you could switch to only $20 notes, by changing a single line
* Did you initially use magic numbers?
* Why are magic numbers bad?
* What is the most future-proof solution? Why?

### Step 3
Imagine your ATM now holds $5 and $10. People want as few notes as possible.
*eg. `withdraw(25)` should return `[10, 10, 5]`*

**Tests:** Replace the tests from the previous step with the tests below, and modify your code until these new tests pass.

```ruby
describe 'atm' do
  [
    [-1, false],
    [0, false],
    [7, false],
    [20, [10, 10]],
    [25, [10, 10, 5]],
    [35, [10, 10, 10, 5]],
  ].each do |input, expected|
    it "should return #{expected} when $#{input} is withdrawn" do
      withdraw(input).must_equal expected
    end
  end
end
```

** Tips for this step**

The `floor` method rounds a number down to the nearest whole integer.

Example:

```ruby
my_number = 3.87.floor # my_number contains 3

my_number = (25/10).floor
# my_number now contains 2, because 25/10 = 2.5, and floor will round that down to 2.
```

### Step 4
Imagine your ATM now holds $20, $10 and $5 notes. Modify your function to accommodate this. (If your function gets long, feel free to break it up).

*Note that at this point, each higher denomination can be evenly divided by each lower denomination - eg. $20 / $10 = 2. Things get much trickier when that's not the case (eg, $50 and $20). For this step, we'll intentionally not deal with this case to make it easier.*

**Tests:** Replace the tests from the previous step with the tests below, and modify your code until these new tests pass.

```ruby
describe 'atm' do
  [
    [-1, false],
    [0, false],
    [7, false],
    [53, false],
    [35, [20, 10, 5]],
    [40, [20, 20]],
    [65, [20, 20, 20, 5]],
    [70, [20, 20, 20, 10]],
    [75, [20, 20, 20, 10, 5]],
  ].each do |input, expected|
    it "should return #{expected} when $#{input} is withdrawn" do
      withdraw(input).must_equal expected
    end
  end
end
```

** Tips for this step**

To tell if an array is empty: `my_array.empty?`

To tell if an array is not empty: `!my_array.empty?`

To remove the first element off an array: `my_array.shift`. Eg, `[10, 20, 30].shift` results in `[20, 30]`

If your function calls a sub-function, keep in mind that Ruby has no concept of 'pass by value'. Variables are always a reference to an object.

### Step 3/4 Discussion Points
* How many lines did you have to change, going from 3 to 4?
* What if we changed the available notes again (but still intentionally not dealing with the trickier case mentioned above)? Eg. $100, $20 and $10 notes - Could you do this in a single line?
* Refactor your code so that you could change to $100, $20 and $10 notes, by changing a single line.
* What is the most future-proof solution?

## Extra Challenges

### Step 5a - Extra Challenge
Let's tackle the tricker case we mentioned, where each note isn't necessarily a multiple of the next lowest note. For this step, we'll assume we have only $50 and $20 notes available - but we'll be mixing it up more later, so try to keep your code future-proof!

**Hint:** Before writing any code, consider withdrawing the following amounts: $60, $80, $110, $160 - what should it return? What process does it need to go through to arrive at that result? What will your existing code try to do? Consider writing a brief solution in pseudo-code, first.

Note: This step could be solved with recursion. If you've never used recursion, you may like to ask a mentor about it. *(Mentors: you might like to use fibonacci as an example. Touch on the problem of infinite nesting, and the need for an exit condition.)*

**Tests:** Replace the tests from the previous step with the tests below, and modify your code until these new tests pass.

```ruby
describe 'atm' do
  [
    [-1, false],
    [0, false],
    [7, false],
    [29, false],
    [135, false],
    [70, [50, 20]],
    [80, [20, 20, 20, 20]],
    [90, [50, 20, 20]],
    [120, [50, 50, 20]],
    [130, [50, 20, 20, 20, 20]],
    [160, [50, 50, 20, 20, 20]],
    [200, [50, 50, 50, 50]]
  ].each do |amount, expected|
    it "should return #{expected} when $#{input} is withdrawn" do
      withdraw(amount).must_equal expected
    end
  end
end
```

### Step 5b - Extra Challenge
* Read, but don't do, step 6. If you're step 5 code is great, it should only take a few seconds to complete step 6. Can you see why?
* Refactor your step 5 code, to make it as future-ready as possible for step 6.

### Step 6 - Extra Challenge
Imagine you're now able to pass in a second parameter (an array), specifying the denominations of (Australian) note available for that withdrawal.

*Eg. atm(220, [50, 20, 5]) says to withdraw $220, with only $50, $20 and $5 notes available.*

Assume people prefer to get the highest possible denomination of note - eg, withdraw(65, [50, 20, 5]) should return [50, 5, 5, 5] rather than [20, 20, 20, 5], because $50 is highest.

*(If you've re-factored your step 5 code well enough, this step should only take a few seconds!)*

**Tests:** Replace the tests from the previous step with the tests below, and modify your code until these new tests pass.

```ruby
describe 'atm' do
  [
    [-1, [20, 10], false],
    [0, [100, 50, 20], false],
    [50, [100, 20], false],
    [120, [50, 10, 5], [50, 50, 10, 10]],
    [65, [50, 20, 10, 5], [50, 10, 5]],
    [80, [50, 20, 5], [50, 20, 5, 5]],
    [130, [100, 50, 20, 10, 5], [100, 20, 10]],
    [160, [50, 20], [50, 50, 20, 20, 20]],
  ].each do |amount, denoms, expected|
    it "should convert the number #{amount} with #{denoms} to #{expected}" do
      withdraw(amount, denoms).must_equal expected
    end
  end
end
```

### Final Discussion Points
* Given a particular solution *works*, what makes it 'good' or 'bad' code?
* Can you think of any take-home best practices or principals? Is code structure important? Why?
* Did you have any 'Aha!' moments? What were they?
* Lets say you started a little ATM company, which quickly expanded to become a global success. How suitable is your code for dealing with all denominations of currency, in all nations of the world? Did it get more suitable with each step?


