puts "Let's play Blackjack!"
puts "What is your name?"
player_name = gets.chomp

puts "Welcome #{player_name}!"

numbers = ['Ace', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King']
suits = ['Hearts', 'Diamonds', 'Spades', 'Clubs']

deck = []
suits.each do |suit|
  numbers.each do |number|
    deck.push({rank: number, suit: suit})
  end
end
game_deck = deck.shuffle

def calculate_hand(hand)
  total = 0
  count_ace = 0
  ace_in_hand = false

  hand.each do |card|
    if card[:rank] == 'Ace'
      total += 11
      count_ace += 1
      ace_in_hand =  true
    elsif card[:rank].to_i == 0
      total += 10
    else
      total += card[:rank].to_i
    end

    if ace_in_hand == true
      begin
        ace_total = count_ace * 10
        if total > 21
          total -= ace_total
          count_ace -= 1
        end
      end until count_ace == 0
    end
  end
  p total
end

def draw_table(player, dealer)
  system 'clear'
  puts "+-----------------------------------+"
  puts "Dealer's cards"
  # only show dealer's upcard
  puts "+-----------------------------------+"
  puts "Your cards:"
  player.each { |card| puts "#{card[:rank]} of #{card[:suit]}" }
  puts "+-----------------------------------+"
end


# begin
player_hand = []
dealer_hand = []

player_hand.push(game_deck.pop)
dealer_hand.push(game_deck.pop)
player_hand.push(game_deck.pop)
dealer_hand.push(game_deck.pop)

draw_table(player_hand, dealer_hand)

calculate_hand(player_hand)
calculate_hand(dealer_hand)

# puts "Would you like to play another hand? (Y/N)"
# answer = gets.chomp.upcase
# end until answer == 'N'

# need a shuffled deck (discard used cards)
# take bet
# player 1 and dealer both dealt 2 cards
# calculate dealer total
# if under 17 dealer must hit
# if 21 blackjack win
# both blackjack equals ties
# player can choose to hit or stay
# until winner or bust