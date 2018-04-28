require 'yaml'
MESSAGES = YAML.load_file("calculator_messages.yml")

def prompt(message)
  Kernel.puts("=> #{message}")
end

def integer?(num)
  num.to_i.to_s == num
end

def float?(num)
  #First regex: zero or more digits + zero or one '.' + zero or more digits
  #Second regex is to reject "." (without digit)
  /^\d*\.?\d*$/.match(num) && /\d/.match(num)   
end

def valid_number?(num)
  integer?(num) || float?(num)
end

x = ''
y = ''
operator = ""
prompt(MESSAGES["welcome"])

loop do
  loop do
    prompt(MESSAGES["enter_x"])
    x = Kernel.gets.chomp

    if valid_number?(x)
      x = x.to_f
      break
    else
      prompt(MESSAGES["invalid_number"])
    end
  end

  loop do
    prompt(MESSAGES["enter_y"])
    y = gets.chomp

    if valid_number?(y)
      y = y.to_f
      break
    else
      prompt(MESSAGES["invalid_number"])
    end
  end



  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG
  prompt(operator_prompt)

  loop do
    operator = gets.chomp
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt (MESSAGES["invalid_option"])
    end
  end

  result = case operator
  when '1'
    x + y
  when '2'
    x - y
  when '3'
    x * y
  when '4'
    x / y
  else
    prompt("Invalid command")
  end

  prompt "Result is #{result}"

  prompt(MESSAGES["retry"])
  do_again = gets.chomp.downcase
  break if do_again != "y"
end

prompt(MESSAGES["thank_you"])