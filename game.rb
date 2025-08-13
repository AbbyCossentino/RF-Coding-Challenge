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

def card_values(cards)
  cards.map {|c| c == nil ? 0 : c.value}
end

def is_tied(cards)
  values = card_values(cards)
  return values.select {|v| v == values.max} .size > 1
end

def winning_card_idx(cards)
  values = card_values(cards)
  return values.index(values.max)
end

def play_turn(player_decks)
  cards = player_decks.map {|d| d.empty? ? nil : d.shift}
  in_play = cards.dup.select {|c| c != nil}

  puts "Cards Played:  " + cards.map {|c| format("%2s", c)} .join("  ")

  while is_tied(cards) do
    max_value = card_values(cards).max
    cards.each_index do |i|
      if cards[i] != nil and cards[i].value == max_value
        cards_dealt = player_decks[i].shift(4)
        in_play += cards_dealt
        cards[i] = cards_dealt.last unless cards_dealt.empty?
      else
        cards[i] = nil
      end
    end
    puts "Cards Played:  " + cards.map {|c| format("%2s", c)} .join("  ")
  end

  player_decks[winning_card_idx(cards)] += in_play.shuffle
end
