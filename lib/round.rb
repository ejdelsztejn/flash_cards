require './lib/card'
require './lib/deck'
require './lib/turn'

class Round
  attr_reader :deck, :turns, :num_correct, :finished_cards
  def initialize(deck)
    @deck        = deck
    @turns       = []
    @num_correct = 0
    @total_cards = deck.count
  end

  def current_card
    deck.cards.first
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    turns << turn
    deck.cards.shift
    turn
  end

  def number_correct
    @turns.each do |turn|
      @num_correct += 1 if turn.guess == turn.card.answer
    end
    num_correct
  end

  def number_correct_by_category(category)
    num_correct_category = 0
    turns.each do |turn|
      if turn.card.category == category
        num_correct_category += 1 if turn.correct?
      end
    end
    num_correct_category
  end

  def percent_correct
    ((num_correct / @total_cards.to_f) * 100).round(2)
  end

  def percent_correct_by_category(category)
    turns_category = 0
    turns.each do |turn|
      turns_category += 1 if turn.card.category == category
    end
    (number_correct_by_category(category).to_f / turns_category.to_f * 100).round(2)
  end

end
