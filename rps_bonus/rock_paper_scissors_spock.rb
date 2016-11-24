VALID_CHOICES = %w(rock paper scissors lizard spock)
RULES = {
  'rock' => %w(scissors lizard),
  'paper' => %w(rock spock),
  'scissors' => %w(lizard paper),
  'lizard' => %w(spock paper),
  'spock' => %w(rock scissors)
}

def prompt(message)
  Kernel.puts("=>#{message}")
end

def shorthand_convert(player_choice)
  if player_choice.downcase() == 's'
    return spock_or_scissor(player_choice)
  end

  VALID_CHOICES.each do |option|
    return option if option[0] == player_choice[0]
  end
end

def spock_or_scissor(player_choice)
  if player_choice == player_choice.upcase()
    'spock'
  else
    'scissors'
  end
end

def shorthand_check(player_choice)
  return false if player_choice.length() != 1
  VALID_CHOICES.each do |choice|
    return true if choice[0] == player_choice || player_choice == 'S'
  end
  false
end

def win?(player1, player2)
  RULES[player1.downcase()].include?(player2.downcase())
end

def display_results(player, computer)
  if player.length() == 1
    player = shorthand_convert(player)
  end
  if win?(player, computer)
    prompt('You win!')
  elsif win?(computer, player)
    prompt('Computer won!')
  else
    prompt('Tie game!')
  end
end

player_score = 0
computer_score = 0
prompt('This game is first to five!')

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    prompt('You can also use the first character of your choice!')
    prompt('Note: \'S\' for spock and \'s\' for scissors.')

    choice = Kernel.gets().chomp()
    break if VALID_CHOICES.include?(choice.downcase) || shorthand_check(choice)
    prompt("That's not a valid choice.")
  end

  computer_choice = VALID_CHOICES.sample
  if choice.length == 1
    choice = shorthand_convert(choice)
  end

  prompt("You chose #{choice}.")
  prompt("The computer chose #{computer_choice}.")

  display_results(choice, computer_choice)

  if win?(choice, computer_choice)
    player_score += 1
  elsif win?(computer_choice, choice)
    computer_score += 1
  end

  if player_score > 0 || computer_score > 0
    prompt("Current score! You: #{player_score} Computer: #{computer_score}")
  end

  break if player_score > 4 || computer_score > 4
  answer = ''
  loop do
    prompt('Do you want to play again? Please enter yes or no.')
    answer = Kernel.gets().chomp()
    # string literal warning below
    break if answer.downcase() == 'no' || answer.downcase() == 'yes'
  end
  break if answer.downcase() == 'no'
end
