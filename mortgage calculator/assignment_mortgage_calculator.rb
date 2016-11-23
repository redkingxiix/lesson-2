require 'yaml'
LANGUAGE = 'en'
MESSAGE = YAML.load_file('loan.yml')

def prompt(key)
  message = MESSAGE[LANGUAGE][key]
  Kernel.puts("=>#{message}")
end

def calculate(loan_amount, rate, months)
  rate = rate.to_f / 100
  loan_amount = loan_amount.to_f
  months = months.to_i
  m = loan_amount * (rate / (1 - (1 + rate)**(-months))) 
  sprintf "%.2f", m
end

def valid_number(num)
  valid_int(num) || valid_float(num)
end

def valid_float (num)
  num == num.to_f.to_s && num.to_f.to_s != "0.0"
end

def valid_int(num)
  num == num.to_i.to_s
end

prompt('welcome')


name = Kernel.gets.chomp
loop do
  if name.empty?
    prompt('name_error')
  else
    break
  end
end

loop do

  prompt('loan_amount')
  loan_amount = ""
  rate = ""
  months = "" 
  loop do
    loan_amount = Kernel.gets.chomp
    if valid_number(loan_amount) 
      break
    else
      prompt('decimal_error')
    end
  end

  prompt('rate')
  loop do
    rate = Kernel.gets.chomp
    if valid_number(rate) 
      break
    else
      prompt('decimal_error')
    end
  end

  prompt('month')
  loop do
    months = Kernel.gets.chomp
    if valid_number(months) 
      break
    else
      prompt('number_error')
    end
  end

  result = calculate(loan_amount, rate, months)
  prompt('result') 
  Kernel.puts '=>' + result.to_s
  prompt('again')
  answer = Kernel.gets.chomp
  break unless answer.downcase.start_with?("y")
end

prompt('Thanks') 


