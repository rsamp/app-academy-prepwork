require "board"
require "player"

class BattleshipGame
  attr_reader :board, :player

  def initialize(player = HumanPlayer.new("Jeff"), board = Board.random)
  # def initialze(player, board)
    @player = player
    @board = board
    @hit = false
  end

  def attack(space)
    board[space] = :x
  end

  def count
    board.count
  end

  def game_over?
    board.won?
  end

  def play_turn
    play = player.get_play
    attack(play)
  end
end
