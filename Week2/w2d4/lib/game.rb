require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
  # attr_accessor :board

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
  end

  def board
    @board = Board.new
  end
end
