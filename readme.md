# Programming a Ruby ATM

In this exercise you will program a function to handle withdrawing money from an ATM. Your function will accept an amount, and return an array representing the notes to return.

We'll start *very* simple, then add increasingly complex restrictions as we go. Each step should provide opportunities to discuss certain aspects of programming theory, code structure, etc.

Unless otherwise stated, you're atm function should return an array of notes which exactly match the amount parameter, or false if the amount cannot be matched exactly.
eg 1. withdraw(27) returns false
eg 2. withdraw(70) might return [50, 20]

For each step, we'll have a single starting-point file, including (failing) tests. Your job will be to fill in the blanks until the tests pass. If the first steps are too easy, wiz through them and help a beginner.

We provide an example solution for each step. It's just an example - not THE solution. (For several steps, a typical sub-par solution is intentionally given. You might discuss why it's sub-par, and how it could be improved. For clarity, we do avoid complex single lines)

To run the tests:

- Using sublime: Press command-B (Or select Tools -> Build)
- Using console: ruby filename.rb


**Step 1** Imagine an ATM that holds only $5 notes. Write a function to return an array of $5 notes, for a given amount. (eg. 15 returns [5, 5, 5])

**Step 2** Now imagine the ATM returns only $10 notes. Modify your function to accommodate this.

**Step 1/2 discussion points**
* how many lines did you have to change? What if we now restricted it to another single denomination (eg. $20 notes)? How many lines would you have to change this time?
* did you initially use magic numbers?
* why are magic numbers bad?
* what is the most future-proof solution?

**Step 3** Imagine your ATM now holds $5 and $10. People want as few notes as possible (eg. 25 returns [10, 10, 5])

**Step 4** Imagine your ATM now holds $50 and $20 notes, only. Modify your function to accommodate this.

**Step 3/4 discussion points**
* how many lines did you have to change, going from 3 to 4? What if we changed the requirements again? (eg. $100, $50 and $20 notes)? Could you do this in a single line?
* what is the most future-proof solution?
* read, but don't do, step 5. If your step 4 code is great, step 5 should take a few seconds. Will it? Refactor your step 4 code to be as ready as possible for step 5.

**Step 5** Imagine you're now able to specify a second parameter (an array), specifying the denominations of (Australian) note available for that withdrawal. eg. atm(220, [50, 20, 5]) says to withdraw $220, with only $50, $20 and $5 notes available.

**Step 6** Lets say you now introduce some bizarre, non-round denominations. eg, $23, $14, and $9 notes. Does your function still work? Can it tell when to return false? What about if the denominations aren't specified in descending order? Refactor so that it works for any denomination.

** Final Talking Points **
* Lets say you started a little ATM company, which quickly expanded to become a global success. How suitable is your code for dealing with all possible denominations of currency, in all nations of the world?
* What did you learn? Can you think of any take-home best practices or principals? Is code structure important? Why? Given a particular solution *works*, what makes it 'good' or 'bad'?
