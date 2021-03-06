require './lib/card'

class Turn
  attr_reader :string, :card

  def initialize(string, card)
    @string = string
    @card   = card
  end

  def guess
    string
  end

  def correct?
    string.downcase == card.answer.downcase
  end

  def feedback
    return "Correct!" if correct?
    return "Incorrect." if !correct?
  end
end
