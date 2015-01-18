puts "Let's play Blackjack!"
puts "What is your name?"
player_name = gets.chomp

puts "Welcome #{player_name}!"

deck = {'Ace' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7,
        '8' => 8, '9' => 9, '10' => 10, 'Jack' => 10, 'Queen' => 10, 'King' => 10}

suits = ['Hearts', 'Diamonds', 'Spades', 'Cloves']

suited_deck = {}
suits.each do |suit|
  deck.each do |key, value|
    suited_deck.store("#{key} of #{suit}", value)
  end
end
shuffled_deck = Hash[suited_deck.to_a.sample(suited_deck.length)]

puts shuffled_deck

used_cards = {}
def deal_card(suited_deck, used_cards)
  card = suited_deck.keys.sample
  card << used_cards
end

begin
puts "How much would you like to bet? (Max bet: $1,000)"
bet = gets.chomp.to_i
end until bet <= 1000

def deck_empty?(suited_deck, used_cards)
  suited_deck.eql?(used_cards)
end






# need a shuffled deck (discard used cards)
# take bet
# player 1 and dealer both dealt 2 cards
# calculate dealer total
# if under 17 dealer must hit
# if 21 blackjack win
# both blackjack equals ties
# player can choose to hit or stay
# until winner or bust

