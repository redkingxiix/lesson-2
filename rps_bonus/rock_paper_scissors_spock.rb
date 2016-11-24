VALID_CHOICES = %w(rock paper scissors lizard spock)
RULES = {
  'rock' => %w(scissors lizard),
  'paper' => %w(rock spock),
  'scissors' => %w(lizard paper),
  'lizard' => %w(spock paper),
  'spock' => %w(rock scissors)
}

@player_score = 0
@computer_score = 0

def prompt(message)
  Kernel.puts("=>#{message}")
end

def shorthand_convert(player_choice)
  if player_choice.downcase() == 's'
    return spock_or_scissor(player_choice)
  end

  VALID_CHOICES.each do |option|
    return option if option.chars[0] == player_choice
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
    return true if choice.chars[0] == player_choice || player_choice == 'S'
  end
  false
end

def win?(player1, player2)
  RULES[player1].include?(player2)
end

def display_results(player, computer)
  player = shorthand_convert(player) if player.length() == 1
  if win?(player, computer)
    add_point('user')
    prompt('You win!')
  elsif win?(computer, player)
    add_point('comp')
    prompt('Computer won!')
  else
    prompt('Tie game!')
  end
end

def add_point(winner)
  if winner == 'user'
    @player_score += 1
  elsif winner == 'comp'
    @computer_score += 1
  end
end

loop do
  choice = ''
  loop do
    if @player_score == 0 || @computer_score == 0
      prompt('This game is first to five!')
    end

    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    prompt('You can also use the first character of your choice!')
    prompt('Note: \'S\' for spock and \'s\' for scissors.')

    choice = Kernel.gets().chomp()
    break if VALID_CHOICES.include?(choice) || shorthand_check(choice)
    prompt("That's not a valid choice.")
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose #{shorthand_convert(choice)}.")
  prompt("The computer chose #{computer_choice}.")
  display_results(choice, computer_choice)

  if @player_score > 0 || @computer_score > 0
    prompt("Current score! You: #{@player_score} Computer: #{@computer_score}")
  end

  break if @player_score > 4 || @computer_score > 4

  prompt('Do you want to play again?')
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end
