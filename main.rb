require 'optparse'
require 'ostruct'

require './card'
require './game'

options = OpenStruct.new
options.num_players = 2

OptionParser.new do |opt|
  opt.on('-n=N', '--num_players=N', OptionParser::DecimalInteger, "Number of players") do |o|
    options.num_players = o
  end
end.parse!

player_decks = deal_cards(options.num_players)

while player_decks.select {|d| !d.empty?} .size > 1
  play_turn(player_decks)
end

