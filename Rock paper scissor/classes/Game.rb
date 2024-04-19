require 'io/console'
require_relative '../interfaces/game_interface'

class Game
  attr_accessor :moves, :generator, :rules, :table
  attr_reader :result

  def initialize(moves, generator, rules, table)
    @results = ['Draw!', 'You Win!', 'You Lose!']
    @moves = moves
    @generator = generator
    @rules = rules
    @table = table
  end

  def play_game
    generate_computer_move
    loop do
      display_menu
      user_input = get_user_input
      case user_input
      when '?'
        display_help
        next
      when '0'
        puts 'Exiting the game.'
        return
      end
      user_move_index = user_input.to_i
      unless rules.valid_move?(user_move_index)
        puts 'Invalid move!'
        next
      end
      play(user_move_index)
      display_result
      break
    end
    play_game
  end

  private

  def get_random_move
    rand(moves.length)
  end

  def generate_computer_move
    @key = generator.generate_key
    @computer_move = moves[get_random_move]
    @hmac = generator.generate_hmac(@key, @computer_move)
  end

  def get_user_input
    print 'Enter your move: '
    # STDIN.noecho(&:gets).chomp
    #gets.chomp
    STDIN.gets.chomp

  end
  

  def play(user_move_index)
    @user_move = moves[user_move_index - 1]
    winner = rules.determine_winner(@user_move, @computer_move)
    @result = @results[winner]
  end

  def display_menu
    puts "HMAC: #{@hmac}"
    puts 'Available moves:'
    moves.each_with_index { |move, index| puts "#{index + 1} - #{move}" }
    puts '0 - exit'
    puts '? - help'
  end

  def display_result
    puts "Your move: #{@user_move}"
    puts "Computer move: #{@computer_move}"
    puts @result
    puts "HMAC key: #{@key}\n\n"
  end

  def display_help
    table.print_table
  end
end
