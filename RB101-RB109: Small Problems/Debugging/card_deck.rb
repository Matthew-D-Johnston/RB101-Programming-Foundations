# card_deck.rb

# Modified Code

cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

deck = { :hearts   => cards,
         :diamonds => cards,
         :clubs    => cards,
         :spades   => cards }

def score(card)
  case card
  when :ace   then 11
  when :king  then 10
  when :queen then 10
  when :jack  then 10
  else card
  end
end

# Pick one random card per suit
    
player_cards = []
deck.keys.each do |suit|
  cards = deck[suit]
  cards.shuffle!
  player_cards << cards.pop
end


# Determine the score of the remaining cards in the deck
    
sum = deck.reduce(0) do |sum, (_, remaining_cards)|
  sum += remaining_cards.map { |card| score(card) }.sum
end

puts sum

puts '-----'

# To Fix the sum-being-lower-than-it-should-be problem:

cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

deck = { :hearts   => cards.clone,
         :diamonds => cards.clone,
         :clubs    => cards.clone,
         :spades   => cards.clone }

def score(card)
  case card
  when :ace   then 11
  when :king  then 10
  when :queen then 10
  when :jack  then 10
  else card
  end
end

# Pick one random card per suit
    
player_cards = []
deck.keys.each do |suit|
  cards = deck[suit]
  cards.shuffle!
  player_cards << cards.pop
end


# Determine the score of the remaining cards in the deck
    
sum = deck.reduce(0) do |sum, (_, remaining_cards)|
  sum += remaining_cards.map { |card| score(card) }.sum
end

puts sum
