Twenty-One
==========

## Rules of Twenty-One

* You start with a normal 52-card deck consisting of the 4 suits (hearts, diamonds, clubs, and spades), and 13 values (2, 3, 4, 5, 6, 7, 8, 9, 10, jack, queen, king, ace).
* The goal of Twenty-One is to try to get as close to 21 as possible, without going over. If you go over 21, it's a "bust" and you lose.
* Setup: the game consists of a "dealer" and a "player". Both participants are initially dealt 2 cards. The player can see their 2 cards, but can only see one of the dealer's cards.
* Card values: all of the card values are pretty straightforward, except for the ace. The numbers 2 through 10 are worth their face value. The jack, queen, and king are each worth 10, and the ace can be worth 1 or 11. The ace's value is determined each time a new card is drawn from the deck. For example, if the hand contains a 2, an ace, and a 5, then the total value of the hand is 18. In this case, the ace is worth 11 because the sum of the hand (2 + 11 + 5) doesn't exceed 21. Now, say another card is drawn and it happens to be an ace. Your program will have to determine the value of both aces. If the sum of the hand (2 + 11 + 5 + 11) exceeds 21 then one of the aces must be worth 1, resulting in the hand's total value being 19. What happens if another card is drawn and it also happens to be an ace? It can get tricky if there are multiple aces in a hand, so your program must account for that.
* Player turn: the player goes first, and can decide to either "hit" or "stay". A hit means the player will ask for another card. Remember that if the total exceeds 21, then the player "busts" and loses. The decision to hit or stay will depend on what the player's cards are and what the player thinks the dealer has. For example, if the dealer is showing a "10" (the other card is hidden), and the player has a "2" and a "4", then the obvious choice is for the player to "hit". The player can continue to hit as many times as they want. The turn is over when the player either busts or stays. If the player busts, the game is over and the dealer won.
* Dealer turn: when the player stays, it's the dealer's turn. The dealer must follow a strict rule for determining whether to hit or stay: hit until the total is at least 17. If the dealer busts, then the player wins.
* Comparing cards: when both the player and the dealer stay, it's time to compare the total value of the cards and see who has the highest value.

## Implementation Steps

The very high level steps of implementing Twenty-One appear to be pretty straight forward. Here's a stab at some high level pseudo-code:
```
1. Initialize deck
2. Deal cards to player and dealer
3. Player turn: hit or stay
  - repeat until bust or "stay"
4. If player bust, dealer wins.
5. Dealer turn: hit or stay
  - repeat until total >= 17
6. If dealer bust, player wins.
7. Compare cards and declare winner.
```
There are some tricky parts in coming up with the looping constructs, but that seems to be a decent high level flow.

## Tips on Getting Started

1. Figure out a data structure to contain the "deck" and the "player's cards" and "dealer's cards". Maybe a hash? An array? A nested array? Your decision will have consequences throughout your code, but don't be afraid of choosing the wrong one. Play around with an idea, and see how far you can push it. If it doesn't work, back out of it.
2. Calculating Aces. Remember that aces can be worth either 1 or 11, depending on the context. You should not ask the user what the value of the ace is; your program should be able to figure this out automatically.
3. Player turn. When thinking about how to code up the player's turn, think about a loop that keeps asking the player to either "hit" or "stay". Now, think about the breaking condition for that loop. When do we stop asking that question to the user? Some pseudo-code may help.
```
1. ask "hit" or "stay"
2. if "stay", stop asking
3. otherwise, go to #1
```
That seems pretty straight forward. Let's code it up:
```ruby
loop do
  puts "hit or stay?"
  answer = gets.chomp
  break if answer == 'stay'
end
```
Notice that because we want to ask the user the question at least once, the `break` happens at the bottom of the loop. If the user chose anything other than "stay", then the loop continues. Can you think of another condition that can cause the loop to break?  

What about if the user keeps hitting, and the player busts? We'd have to adjust our break condition:
```ruby
loop do
  puts "hit or stay?"
  answer = gets.chomp
  break if answer == 'stay' || busted? # the busted? method is not shown
end
```
This means that the user can only exit the loop if one of those two things happen: either the player stays or the player busts. This means that after the loop, we can then handle those two conditions:
```ruby
answer = nil
loop do
  puts "hit or stay?"
  answer = gets.chomp
  break if answer == 'stay' || busted? # the busted? method is not shown
end

if busted?
  # probably end the game? or ask the user to play again?
else
  puts "You chose to stay!" # if player didn't bust, must have stayed to get here
end

# ... continue on to Dealer turn
```
4. Dealer turn. The dealer turn will follow a very similar pattern as the player turn. Except: the dealer's break condition will occur at the top of the "hit or stay" loop. See if you can figure out why that is.
5. When you display the results, you also need to perform the calculation of who won. Having one method that does both the calculation and the display to the output makes it hard to reason about. The trick is to create a method that only returns the result of the game, and another that only handles displaying the result. You want to write methods that only do one thing. 

## My Pseudo-Code

**Data Structure**  

_Deck of Cards_  
1. An array of hashes for the card numbers and their face values: `face_values = [{ '2' => 2 }, { '3' => 3 }, ... { 'king' => 10 }, { 'ace' = [1, 11] }]`; after writing this out, I may have to make all the values arrays to match the array value of the `'ace'` key. Hence: `[{ '2' => [2] }, { '3' => [3] }, ... { 'king' => [10] }, { 'ace' = [1, 11] }]`
2. Then create a hash containing the four suits whose values are the same: the array of hashes containing the card numbers and their face values. Hence: `{ hearts: face_values, diamonds: face_values, clubs: face_values, spades: face_values }`
3. Here is the structure I have come up with:
```ruby
card_deck = { '2' => [2, 2, 2, 2], '3' => [3, 3, 3, 3],
         '4' => [4, 4, 4, 4], '5' => [5, 5, 5, 5],
         '6' => [6, 6, 6, 6], '7' => [7, 7, 7, 7],
         '8' => [8, 8, 8, 8], '9' => [9, 9, 9, 9],
         '10' => [10, 10, 10, 10], 'jack' => [10, 10, 10, 10],
         'queen' => [10, 10, 10, 10], 'king' => [10, 10, 10, 10],
         'ace' => [[1, 11], [1, 11], [1, 11], [1, 11]] }
```

_Dealing Method_  
1. Define the two players: 1) `dealer` and 2) `player`. Perhaps, define their hands, as `dealer_hand` and `player_hand`. 
2. Create a `deal_cards` method that returns a single card from the deck, and removes one of the face values from the deck of cards.
3. Here is the method I have come up with:
```ruby
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
```
_Player's Turn_
1. Prompt the player to "hit" or "stay".
2. if the player "hit's", deal another card with the `deal_card` method.
* check the hand to see if the player busted or not.
* count ace's value as 11 unless bust, in which case count as 1.
* if busted, the game is over.
* if not, loop back to prompt the player to "hit" or "stay" again.
3. Thus, we need a prompt method and a check-if-busted method.

_Prompt method_
```ruby
def prompt(message)
  "=> #{message}"
end
```

_Ace In Hand? method_
1. check to see if the an ace is being held.
2. iterate through the hand to check for an ace.
```ruby
def ace_in_hand?(hand)
  !hand.select { |card| card[0] == 'ace' }.empty?
end
```

_Add Card Values method_
1. def add_card_values(hand, ace_value = 0) (ace_value = 0 will add 1, while ace_value = 1 will add 11)
2. iterate over the arrays within the hand.
* if array[0] == 'ace', then add array[1][0 or 1]
* else, add array[1]
```ruby
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
```


_Busted? method_
1. Add up the values of the player's hand, which will be an array with nested arrays.
2. Each nested array contains the card (a string) and a value (an integer); however, if the card is an ace, there will be two potential values nested within
another array. When first adding the value, count the ace's value as 11
3. If the total of the player's hand is more than 21, check to see if the player holds an ace. If the player holds an ace, add the values with the ace equal to 1.
4. If less than or equal to 21, the method returns false.
5. 

