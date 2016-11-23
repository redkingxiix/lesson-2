require 'yaml'
LANGUAGE = 'en'
MESSAGES = YAML.load_file('calculator_messages.yml')

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt message
  Kernel.puts "=> #{message}"
end

def operator_to_message op
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


def valid_number?(input)
  integer?(input) || float?(input)
end

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end


prompt messages('welcome',LANGUAGE)
name = ''

loop do
  name = Kernel.gets.chomp
  if name.empty?
  prompt messages('valid_name',LANGUAGE)
  else
    break
  end
end

loop do
  first_number = ""
  loop do
    prompt messages('number',LANGUAGE)
    first_number = Kernel.gets.chomp
    if valid_number? first_number
      break
    else
      prompt messages('valid_number',LANGUAGE)
    end
  end

  second_number = ""
  loop do
    prompt messages('number',LANGUAGE)
    second_number = Kernel.gets.chomp
    if valid_number? second_number
      break
    else 
      prompt messages('valid_number',LANGUAGE)
    end
  end

  operator_prompt = <<-MSG
    What operator would you like to use?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt operator_prompt
  operator = ""
  loop do
    operator = Kernel.gets.chomp
    if %w(1 2 3 4).include? operator
      break
    else
      prompt operator_prompt
    end
  end
  
  result =  case operator
    when '1'
      first_number.to_i + second_number.to_i
    when '2'
      first_number.to_i - second_number.to_i
    when '3'
      first_number.to_i * second_number.to_i
    when '4'
      first_number.to_i / second_number.to_i
  end
  prompt "#{operator_to_message operator} the two numbers" 
 

  prompt messages('result',LANGUAGE) + result.to_s
  prompt messages('again',LANGUAGE)
  answer = Kernel.gets.chomp
  break unless answer.downcase.start_with? 'y'
end

prompt messages('goodbye',LANGUAGE) + name
