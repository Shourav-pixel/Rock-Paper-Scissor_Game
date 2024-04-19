require_relative '../interfaces/table_interface'
require_relative '../interfaces/rules_interface'
require 'cli/ui'
require 'terminal-table'


class Table
  def initialize(moves, rules)
    @results = ['Draw', 'Win', 'Lose']
    @moves = moves
    @rules = rules
    @table = generate_table
  end

  def print_table
    puts @table
  end

  private

  def generate_table
    table = Terminal::Table.new
    table.headings = ['User↓/PC→', *@moves]
    @moves.each do |user_move|
      row = generate_row(user_move)
      table.add_row(row)
    end
    table
  end

  def generate_row(user_move)
    row = [user_move]
    cells = @moves.map { |computer_move| generate_cell(user_move, computer_move) }
    row.concat(cells)
  end

  def generate_cell(user_move, computer_move)
    winner = @rules.determine_winner(user_move, computer_move)
    @results[winner]
  end
end

