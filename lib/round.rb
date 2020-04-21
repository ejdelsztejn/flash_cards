require './lib/card'
require './lib/deck'
require './lib/turn'

class Round
  attr_reader :deck, :turns, :turn_num
  def initialize(deck)
    @deck     = deck
    @turns    = []
    @turn_num = 0
  end

  def current_card
    deck.cards[turn_num]
  end

  def take_turn(guess)

  end
end
