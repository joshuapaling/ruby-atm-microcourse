# Rails Girls Tutorial: Programming a Ruby ATM

*Created by Joshua Paling, [@joshuapaling](https://twitter.com/joshuapaling)*

This is the last exercise of the day, and it's intended to challenge you. We'll be using TDD (which you learned about earlier), but all the tests have been written for you, already.

We'll be writing a function to handle withdrawing money from an ATM. It will accept an amount, and return either an `array` representing the notes to return, or `false` if that amount cannot be made up of the available notes.

Hopefully this provides you with the thrill of writing your own original code to solve a problem.

**Beginners**, don't worry - we'll start simple.
**Advanced devs** - don't worry, we'll ramp things up pretty steeply!

### Workflow
Each step has pre-written tests, to verify your code works. For each step, you'll take the following actions:

a) Copy the tests for that step, and paste them over the top of the previous tests.

b) Modify your code, and re-run the tests, until all tests pass. *Note: some steps have tips at the bottom - make sure to read those.*

c) Some steps have discussion points. Discuss them - they'll help you moving forward.

d) Repeat.

### To run the tests:

**Using Sublime Text:** With your solution open, Press command-B (Or select Tools -> Build)

**Using console:** `cd /path/to/directory/` and then run `ruby atm.rb` *(assuming your file is called atm.rb)*

### Step 1

Imagine an ATM that holds only $5 notes. Write a function that returns `true` if an amount can be returned, and `false` otherwise.

*Eg. 1 `withdraw(15)` should return `true`*

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
    [17, false],
    [5, true],
    [20, true],
    [35, true],
  ].each do |input, expected|
    it "should return #{expected} when $#{input} is withdrawn" do
      withdraw(input).must_equal expected
    end
  end
end
```

### Step 2

Now, modify your function so that if the amount *can* be withdrawn, it will return the appropriate number of notes, rather than simply `true`

*Eg. 1 `withdraw(15)` should return `3`, since three $5 notes makes $15*

**Tests:**

```ruby
describe 'atm' do
  [
    [-1, false],
    [0, false],
    [1, false],
    [43, false],
    [7, false],
    [5, 1],
    [20, 4],
    [35, 7],
  ].each do |input, expected|
    it "should return #{expected} when $#{input} is withdrawn" do
      withdraw(input).must_equal expected
    end
  end
end
```

### Step 3

In programming, an `array` is basically a collection of things. It's like a list.

Rather than returning the number of notes, modify your code so that it returns an array of notes (in this case, all $5's).

*Eg. 1 `withdraw(15)` should return an array, `[5, 5, 5]`. (That's basically a collection of three $5 notes)*

*note: you should still return false for amounts that can't be returned.*

**Tests:**

```ruby
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

### Step 4
Now imagine the ATM returns only $10 notes. Modify your function to accommodate this.

*Eg. 1 `withdraw(20)` should return an array, `[10, 10]`*

*Eg. 2 `withdraw(15)` should return `false`, because $15 cannot be made up of $10 notes*

**Tests:**

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

### Step 3/4 Discussion Points
* How many lines did you have to change? What if we now restricted it to another single denomination (eg. $20 notes)? How many lines would you have to change this time?
* Refactor your code so such that you could switch to only $20 notes, by changing a single line
* Did you initially use magic numbers?
* Why are magic numbers bad?
* What is the most future-proof solution? Why?

### Step 5
Imagine your ATM now holds $5 and $10. People want as few notes as possible.
*eg. `withdraw(25)` should return `[10, 10, 5]`*

**Tests:**

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

### Step 6
Your ATM now holds $20, $10 and $5 notes. Modify your function to accommodate this.

*Note that at this point, each higher denomination can be evenly divided by each lower denomination - eg. $20 / $10 = 2. Things get much trickier when that's not the case (eg, $50's and $20's). For this step, we'll intentionally not deal with this case to make it easier.*

**Tests:**

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

### Step 5/6 Discussion Points
* How many lines did you have to change, going from 3 to 4?
* What if we changed the available notes again (but still intentionally not dealing with the trickier case mentioned above)? Eg. $100, $20 and $10 notes - Could you do this in a single line?
* Refactor your code so that you could change to $100, $20 and $10 notes, by changing a single line.
* What is the most future-proof solution?


### Final Discussion Points
* Given a particular solution *works*, what makes it 'good' or 'bad' code?
* Can you think of any take-home best practices or principals? Is code structure important? Why?
* Did you have any 'Aha!' moments? What were they?
* Lets say you started a little ATM company, which quickly expanded to become a global success. How suitable is your code for dealing with all denominations of currency, in all nations of the world? Did it get more suitable with each step?


