puts "Welcome to Rock Paper Scissors!"

CHOICES = { 'R' => 'Rock', 'P' => 'Paper', 'S' => 'Scissors' }

def winner_message(selection)
  if selection == 'R'
    puts "Rock beats Scissors!"
  elsif selection == 'P'
    puts "Paper wraps Rock!"
  elsif selection == 'S'
    puts "Scissors cuts Paper!"
  end
end

loop do
  begin
    puts "Please choose one: Rock(R), Paper(P) or Scissors(S)"
    player_selection = gets.chomp.upcase
  end until CHOICES.keys.include?(player_selection)

  computer_selection = CHOICES.keys.sample

  puts "You chose #{CHOICES[player_selection]}. Computer chose #{CHOICES[computer_selection]}."

  if player_selection == computer_selection
    puts "It's a tie"
  elsif player_selection == 'R' && computer_selection == 'P' \
   || player_selection == 'P' && computer_selection == 'R' \
   || player_selection == 'S' && computer_selection == 'P'
    winner_message(player_selection)
    puts "You won!"
  else
    puts "Computer won!"
  end

  begin
    puts "Would you like to play again? (Y/N)"
    new_game = gets.chomp.upcase
  end until new_game == 'Y' or new_game ==  'N'
  break if new_game == 'N'
end

puts "Come again!"