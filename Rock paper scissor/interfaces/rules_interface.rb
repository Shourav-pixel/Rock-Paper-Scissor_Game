module RulesInterface
    def is_valid_move(move)
      raise NotImplementedError, "Method 'is_valid_move' must be implemented"
    end
  
    def determine_winner(user_move, computer_move)
      raise NotImplementedError, "Method 'determine_winner' must be implemented"
    end
  end
  