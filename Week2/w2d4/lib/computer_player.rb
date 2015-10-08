class ComputerPlayer
  attr_reader :name, :board
  attr_accessor :mark

  def initialize(name)
    @name = name
  end

  def display(board)
    @board = board
  end

  def get_move
    empty_spaces = find_empty_spaces
    empty_spaces.each do |space|
      return space if winning_move?(space)
    end

    random_move = rand(0..empty_spaces.length - 1)
    return empty_spaces[random_move]
  end

  def winning_move?(space)
    board.place_mark(space, :O)
    if board.winner == :O
      return space
    else
      board.place_mark(space, nil)
    end
  end

  def find_empty_spaces
    empty_spaces = []
    (0..2).each do |i|
      (0..2).each do |j|
        if board.empty?([i,j])
          empty_spaces << [i,j]
        end
      end
    end
    empty_spaces
  end
end
