require_relative '../interfaces/rules_interface'
require_relative '../enums/results'

class Rules
  def initialize(moves)
    @moves = moves
  end

  def valid_move?(move)
    move_index = move.to_i
    numeric?(move_index) && within_range?(move_index)
  end

  def determine_winner(user_move, computer_move)
    user_index = @moves.index(user_move)
    computer_index = @moves.index(computer_move)
    length = @moves.length
    case computer_index
    when user_index
      Results::Draw
    when (user_index + 1) % length, (user_index + length / 2) % length
      Results::Lose
    else
      Results::Win
    end
  end

  private

  def numeric?(value)
    !value.nil? && value.is_a?(Numeric)
  end

  def within_range?(value)
    value >= 1 && value <= @moves.length
  end
end
