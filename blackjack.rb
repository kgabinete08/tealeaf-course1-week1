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

def calculate_hand(hand)
  total = 0
  ace_in_hand = false
  count_ace = 0

  hand.each do |card|
    if card[:rank].to_i == 0
      if card[:rank] == 'Ace'
        ace_in_hand = true
        count_ace += 1
      else
        total += 10
      end
    else  
      total += card[:rank].to_i
    end

    if ace_in_hand
      begin
        if total <= 10
          total + 11
        else
          total + 1
        end
      count_ace - 1
      end while count_ace == 0 
    end
  end
return total
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

begin

  player_hand = []
  dealer_hand = []
  player_total = 0
  dealer_total = 0

  player_hand.push(game_deck.pop)
  player_hand.push(game_deck.pop)

  dealer_hand.push(game_deck.pop)
  dealer_hand.push(game_deck.pop)

  draw_table(player_hand, dealer_hand)

  calculate_hand(player_hand)
  calculate_hand(dealer_hand)

  has_winner = false
  has_winner = winner?(player_total, "#{player_name}")
  has_winner = winner?(dealer_total, "Dealer")

  begin
    puts "Please choose: 1) Hit 2) Stay"
    choice = gets.chomp.to_i
    if ![1, 2].include?(choice)
      puts "Please enter 1 or 2."
      has_winner = false
      choice = 1
      next
    end

    if choice == 1
      player_hand.push(game_deck.pop)
      draw_table(player_hand, dealer_hand)
      player_total = calculate_hand(player_hand)
    end
    has_winner = winner?(player_total, "#{player_name}")
  end while has_winner == false && choice == 1

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

  if !has_winner
    player_total = calculate_hand(player_hand)
    dealer_total = calculate_hand(dealer_hand)
    if player_total > dealer_total
      puts "#{player_name}'s total is #{player_total}, Dealer's total is #{dealer_total}. #{player_name} wins!"
    else
      puts "#{player_name}'s total is #{player_total}, Dealer's total is #{dealer_total}. Dealer wins!"
    end
  end

  begin
    puts "Would you like to play another hand? (Y/N)"
    answer = gets.chomp.upcase
  end while !['Y', 'N'].include?(answer)
end while answer == 'Y'
puts "Play again sometime!"

# need a shuffled deck (discard used cards)
# take bet
# player 1 and dealer both dealt 2 cards
# calculate dealer total
# if under 17 dealer must hit
# if 21 blackjack win
# both blackjack equals ties
# player can choose to hit or stay
# until winner or bust