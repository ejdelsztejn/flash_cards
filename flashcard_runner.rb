require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

# start method
def start(round)
  puts "Welcome! You're playing with #{round.deck.count} cards."
  puts "-------------------------------------------------"
  play(round)
end

# play method
def play(round)
  total_cards = round.deck.count
  card_number = 1
  loop do
    puts "This is card number #{card_number} out of #{total_cards}."
    puts "Question: #{round.current_card.question}"
    answer = gets.chomp.capitalize
    new_turn = round.take_turn(answer)
    puts new_turn.feedback
    break if card_number == total_cards
    card_number += 1
  end
  puts "****** Game over! ******"
  sleep(0.3)
  puts "You had #{round.number_correct} correct guesses out of #{total_cards} for a total score of: #{round.percent_correct}"
end

# create cards
card_1 = Card.new("What is the equivalent decimal number for forty nine thousandths?", "0.049", :Math)
card_2 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_3 = Card.new("What is Jessye's favorite lake?", "Lake Baikal", :Geography)
card_4 = Card.new("What is 9 x 9?", "81", :Math)
card_5 = Card.new("Which African nation has the most pyramids?", "Sudan", :Geograpy)
card_6 = Card.new("What are the basic units of life called?", "Cells", :Biology)
card_7 = Card.new("What year did the Revolutionary War end?", "1783", :US_History)
card_8 = Card.new("Plants mainly receive nutrients from what medium?", "Soil", :Biology)
card_9 = Card.new("What is the largest city by population to connect two continents?", "Istanbul", :Geograpy)
card_10 = Card.new("What country has the most natural lakes?", "Canada", :Geograpy)

deck = Deck.new([card_1, card_2, card_3, card_4, card_5, card_6, card_7, card_8, card_9, card_10])
game = Round.new(deck)

start(game)
