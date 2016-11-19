def prompt(message)
  Kernel.puts("=> #{message}")
end

def operator_to_message(op)
  case op

  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
 end
end

def valid_number?(number)
   number.to_i() != 0
end


prompt("Hello! Welcome to the calculator program. What's your name?")
name = ''

loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt("Please enter a name")
  else
    break
  end
end

loop do
  first_number = ""
  loop do
    prompt("Insert a number")
    first_number = Kernel.gets().chomp()
    if valid_number?(first_number)
      break
    else
      prompt("Doesn't look like a valid number")
    end
  end

  second_number = ""
  loop do
    prompt("Insert another number.")
    second_number = Kernel.gets().chomp()
    if valid_number?(second_number)
      break
    else 
      prompt("Doesn't look like a valid number")
    end
  end

  operator_prompt = <<-MSG
    What operator would you like to use?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt(operator_prompt)
  operator = ""
  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(operator_prompt)
    end
  end
  
  result =  case operator
    when '1'
      first_number.to_i() + second_number.to_i()
    when '2'
      first_number.to_i() - second_number.to_i()
    when '3'
      first_number.to_i() * second_number.to_i()
    when '4'
      first_number.to_i() / second_number.to_i()
  end
  prompt("#{operator_to_message(operator)} the two numbers")

  Kernel.puts("The result is #{result}")
  prompt("Do you want to perform another calculations?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Goodbye! #{name}")
