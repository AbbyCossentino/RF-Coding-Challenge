require 'optparse'
require 'ostruct'

require './card'

options = OpenStruct.new
options.num_players = 2

OptionParser.new do |opt|
  opt.on('-n=N', '--num_players=N', OptionParser::DecimalInteger, "Number of players") do |o|
    options.num_players = o
  end
end.parse!

# Empty deck for each player
player_decks = (1..options.num_players).map { [] }

# Deal cards
deck = new_deck.shuffle
deck.each_index do |idx|
  player_idx = idx % options.num_players
  player_decks[player_idx].push(deck[idx])
end


