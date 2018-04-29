# Method declarations
def prompt(message)
  puts "=> #{message}"
end

def integer?(input)
  Integer(input) rescue false  #following previous lesson's suggestion

def float?(input)
  Float(input) rescue false #following previous lesson's suggestion
end

def valid_positive_number?(input)
  (integer?(input) || float?(input)) && input.to_f > 0
end

def get_float(message)
  # Prints message and validates number that user inputted.
  number = ""
  loop do
    prompt(message)
    number = gets.chomp
    if valid_positive_number?(number)
      number = number.to_f
      break
    else
      prompt("Invalid positive number")
    end
  end

  number
end

def calculate_monthly_payment(loan_amount, monthly_interest_rate, loan_months)
  loan_amount * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**-loan_months))
end

# Real program starts here
prompt("Welcome to the Mortgage Calculator!")

loop do
  loan_amount = get_float("Please enter your loan amount (dollars)")
  annual_rate_decimal = get_float("Please enter your Annual Percentage Rate (in percents)") / 100
  loan_years = get_float("Please enter your loan duration (years)")

  prompt("Loan: #{loan_amount}, Rate:#{annual_rate_decimal}, Years:#{loan_years}")

  loan_months = 12 * loan_years
  monthly_interest_rate = annual_rate_decimal / 12

  monthly_payment = calculate_monthly_payment(loan_amount, monthly_interest_rate, loan_months)
  prompt("Your monthly payment is: $#{format('%.2f', monthly_payment)}")

  prompt("Do you want another calculation? (Y for yes)")
  answer = gets.chomp.downcase
  break unless answer == "y"
  print %x{clear}
end

prompt("Thank you for using this calculator. Goodbye!")
