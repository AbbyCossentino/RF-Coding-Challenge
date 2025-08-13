SUITS = ["d", "h", "s", "c"]
VALUES = (2..14)
VALUES_STR = {
  2 => "2",
  3 => "3",
  4 => "4",
  5 => "5",
  6 => "6",
  7 => "7",
  8 => "8",
  9 => "9",
  10 => "T",
  11 => "J",
  12 => "Q",
  13 => "K",
  14 => "A",
}

class Card
  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  attr_reader :suit, :value

  def to_s
    VALUES_STR[@value] + @suit
  end
end

def new_deck
  deck = []

  SUITS.each do |suit|
    VALUES.each do |value|
      deck.push(Card.new(suit, value))
    end
  end

  return deck
end
