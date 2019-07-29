# twenty_one.rb

# Deck of Cards

card_deck = { '2' => [2, 2, 2, 2], '3' => [3, 3, 3, 3],
         '4' => [4, 4, 4, 4], '5' => [5, 5, 5, 5],
         '6' => [6, 6, 6, 6], '7' => [7, 7, 7, 7],
         '8' => [8, 8, 8, 8], '9' => [9, 9, 9, 9],
         '10' => [10, 10, 10, 10], 'jack' => [10, 10, 10, 10],
         'queen' => [10, 10, 10, 10], 'king' => [10, 10, 10, 10],
         'ace' => [[1, 11], [1, 11], [1, 11], [1, 11]] }

def prompt(message)
  "=> #{message}"
end

def deal_card(deck)
  remaining_cards = deck.select { |_, value| !value.empty? }
  card = remaining_cards.keys.sample
  if card.nil?
    puts "Deck is empty."
  else
    value = deck[card].pop if !deck[card].nil?
    [card, value]
  end
end

def add_card_values(hand)
  total_value = 0

  hand.each do |card|
    total_value += card[0] == 'ace' ? 11 : card[1]
  end

  number_of_aces = hand.count { |card| card[0] == 'ace' }
  while total_value > 21 && number_of_aces > 0
    total_value -= 10
    number_of_aces -= 1
  end

  total_value
end
