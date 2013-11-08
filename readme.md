# Programming a Ruby ATM

In this exercise you will program a function to handle withdrawing money from an ATM. Your function will accept an amount, and return an array representing the notes to return.

We'll start *very* simple, then add increasingly complex restrictions as we go. Each step should provide opportunities to discuss certain aspects of programming theory, code structure, etc.

Unless otherwise stated, you're atm function should return an array of notes which exactly match the amount parameter (eg. 60 might return [20, 20, 20]), or false if the amount cannot be matched exactly (eg. 27 returns false)

For each step, we'll have a single starting-point file, including (failing) tests. Your job will be to fill in the blanks until the tests pass. Feel free to skip the first few steps if they are too easy.

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
* how many lines did you have to change? What if we changed the requirements again? (eg. $100, $50 and $20 notes)? Could you do this in a single line?
* what is the most future-proof solution?
* read, but don't do, step 5. If your step 4 code is great, step 5 should take a few seconds. Will it? Refactor your step 4 code to be as ready as possible for step 5.

**Step 5** Imagine you're now able to specify which denominations of note are available for a given withdrawal.