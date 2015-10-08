require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
  attr_accessor :board, :player_one, :player_two, :current_player

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    player_one.mark = :X
    player_two.mark = :O
    @current_player = player_one
    @board = Board.new
  end

  def play_turn
    move = current_player.get_move
    board.place_mark(move, current_player.mark)
    switch_players!
  end

  def switch_players!
    if current_player == player_one
      self.current_player = player_two
    else # if current_player == player_two
      self.current_player = player_one
    end
  end

end


if $PROGRAM_NAME == __FILE__
  Game.new
end
