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

deck = new_deck.shuffle

