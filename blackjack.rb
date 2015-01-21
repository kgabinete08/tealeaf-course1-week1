# Methods

def calculate_hand(hand)
  total = 0

  hand.each do |card|
    if card[:rank] == 'Ace'
      total += 11
    elsif card[:rank].to_i == 0
      total += 10
    else
      total += card[:rank].to_i
    end
  end

  hand.select { |card| card[:rank] == 'Ace' }.count.times do
    total -= 10 if total > 21
  end
  total
end

def winner?(total, player)
  if total == 21
    puts "#{player} has Blackjack!, #{player} wins!"
    return true
  elsif total > 21
    puts "#{player} busted!"
    return true
  end 
  return false
end

def draw_table(player_hand, dealer_hand)
  system 'clear'
  puts "+-----------------------------------+"
  puts "Dealer's cards:"
  dealer_hand.each { |card| puts "#{card[:rank]} of #{card[:suit]}" }
  puts "+-----------------------------------+"
  puts "Your cards:"
  player_hand.each { |card| puts "#{card[:rank]} of #{card[:suit]}" }
  puts "+-----------------------------------+"
end

# Gameplay

puts "Let's play Blackjack!"
puts "What is your name?"
player_name = gets.chomp

puts "Welcome #{player_name}!"

numbers = ['Ace', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King']
suits = ['Hearts', 'Diamonds', 'Spades', 'Clubs']

deck = []
suits.each do |suit_type|
  numbers.each do |number|
    deck.push({rank: number, suit: suit_type})
  end
end

game_deck = deck.shuffle

begin

  player_hand = []
  dealer_hand = []

  player_hand.push(game_deck.pop)
  player_hand.push(game_deck.pop)

  dealer_hand.push(game_deck.pop)
  dealer_hand.push(game_deck.pop)

  draw_table(player_hand, dealer_hand)

  player_total = calculate_hand(player_hand)
  dealer_total = calculate_hand(dealer_hand)

  has_winner = false
  has_winner = winner?(player_total, "#{player_name}")
  has_winner = winner?(dealer_total, "Dealer")

#Player's turn
  begin
    puts "Please choose: 1) Hit 2) Stay"
    choice = gets.chomp.to_i
    if ![1, 2].include?(choice)
      puts "Please enter 1 or 2."
      has_winner = false
      next
    end

    if choice == 1
      player_hand.push(game_deck.pop)
      draw_table(player_hand, dealer_hand)
      player_total = calculate_hand(player_hand)
    end
    has_winner = winner?(player_total, "#{player_name}")
  end while has_winner == false && choice == 1

#Dealer's turn
    if choice == 2
      dealer_total = calculate_hand(dealer_hand)
        if dealer_total < 17
          begin
            dealer_hand.push(game_deck.pop)
            draw_table(player_hand, dealer_hand)
            dealer_total = calculate_hand(dealer_hand)
          end until dealer_total >= 17
        end
      has_winner = winner?(dealer_total, "Dealer")
    end

#Compare
  if !has_winner
    player_total = calculate_hand(player_hand)
    dealer_total = calculate_hand(dealer_hand)
    if player_total > dealer_total
      puts "#{player_name}'s total is #{player_total}, Dealer's total is #{dealer_total}. #{player_name} wins!"
    elsif player_total < dealer_total
      puts "#{player_name}'s total is #{player_total}, Dealer's total is #{dealer_total}. Dealer wins!"
    else
      puts "It's a tie!"
    end
  end

  begin
    puts "Would you like to play another hand? (Y/N)"
    answer = gets.chomp.upcase
  end while !['Y', 'N'].include?(answer)
end while answer == 'Y'
puts "Play again sometime!"
