# loan_calculator.rb

def prompt(message)
  puts "=> #{message}"
end

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

def valid_number?(input)
  integer?(input) || float?(input)
end

prompt('Welcome to the Mortgage / Car Loan Calculator.')

loop do # main loop

  loan = ''
  loop do # sub-loop 1 (loan)
    prompt('Please enter the loan amount:')
    loan = gets.chomp

    if valid_number?(loan)
      loan = loan.to_f.round
      break
    else
      prompt('Invalid Input: make sure to enter a positive number.')
    end
  end

  apr = ''
  loop do # sub-loop 2: (apr)
    prompt('Please enter the annual percentage interest rate (APR):')
    apr = gets.chomp

    if valid_number?(apr)
      apr = apr.to_f.round(2)
      break
    else
      prompt('Invalid Input: make sure to enter a positive number.')
    end
  end

  duration_y = ''
  loop do # sub-loop 3: (duration_y)
    prompt('Please enter the loan duration in number of years ' +
           '(fractions of a year will be rounded to nearest full year):')
    duration_y = gets.chomp

    if valid_number?(duration_y)
      duration_y = duration_y.to_f.round
      break
    else
      prompt('Invalid Input: make sure to enter a positive number.')
    end
  end

  # intermediate calculations
  mpr = ((apr / 100) / 12).round(10)
  duration_m = duration_y * 12

  # final calculations
  m = loan * (mpr / (1 - (1 + mpr) ** (-duration_m)))

  # result
  puts "Your monthly loan payment is $#{m.round(2)}"  

  # final message
  prompt ('Would you like to do another loan calculation? (Y or N)')
  response = gets.chomp

  break if response.downcase == 'n'
end

prompt('Thank you for using the Mortgage / Car Loan Calculator. Good bye!')


# Problems:
# Need to handle commas ',' in loan amount (e.g. 450,000)
# Final result does not print 2 full decimals if last digit(s) is/are zero(s).


