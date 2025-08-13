require 'optparse'
require 'ostruct'

require './card'

def deal_cards(num_players)
  player_decks = (1..num_players).map { [] }
  deck = new_deck.shuffle
  deck.each_index do |idx|
    player_idx = idx % num_players
    player_decks[player_idx].push(deck[idx])
  end

  return player_decks
end

def winning_card(cards)
  values = cards.map {|c| c.value}
  max_value = values.max
  return nil if cards.select {|c| c.value == max_value}.size > 1
  return values.index(max_value)
end

