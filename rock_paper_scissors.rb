
VALID_CHOICES = ['rock','paper','scissors']

def prompt(message)
  Kernel.puts("=>#{ message}")
end

def display_results(player, computer)
 if(player == 'rock' && computer == 'scissors') ||
    (player == 'paper' && computer == 'rock') ||
    (player == 'scissors' && computer == 'paper')
    prompt("You won!") 
  elsif(computer == 'rock' && player == 'scissors') ||
    (computer == 'paper' && player == 'rock') ||
    (computer == 'scissors' && player == 'paper')
    prompt("Computer won!") 
  else
    prompt("Tie game!")
  end
end
loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end
  computer_choice = VALID_CHOICES.sample

  prompt("You chose #{choice}. The computer chose #{computer_choice}")

  display_results(choice, computer_choice)
  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end
