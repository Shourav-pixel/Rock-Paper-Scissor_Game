require_relative 'classes/generator'
require_relative 'classes/rules'
require_relative 'classes/tables'
require_relative 'classes/game'
require_relative 'utils/utils'

args = ARGV

def main(args)
  if validate_arguments(args)
    moves = args
    generator = Generator.new
    rules = Rules.new(moves)
    table = Table.new(moves, rules)
    game = Game.new(moves, generator, rules, table)
    game.play_game
  end
end

main(args)
