Mortgage / Car Loan Calculator
==============================

## Problem
Create a mortgage / car loan calculator in ruby.
Calculate monthly loan payments based on the following inputs:
1. The total loan amount ($XXX.XX);
2. The Annual Percentage Rate (APR; XX.XX%);
3. The loan duration (years).
Thus, the created method will need to contain three parameters: 
`loan_calculator(loan, apr, duration)`

As intermediate steps, use this information to calculate the following:
1. A monthly interest rate (APR/12);
2. Loan duration in months(years * 12).

Formula to be used to calculate monthly payments:
m = p * (j / (1 - (1 + j)**(-n)))
* m = monthly payment
* p = loan amount
* j = monthly interest rate
* n = loan duration in months

## Examples / Test Cases


