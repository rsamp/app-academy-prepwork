class HumanPlayer
  attr_reader :name, :board

  def initialize(name)
    @name = name
    @board
  end

  def get_move
    puts "Where would you like to move? (form: '0, 0')"
    move = gets.chomp.split(", ")
    move.map! { |pos| pos.to_i }
  end

  # def display(board)
  #   board.grid.each do |row|
  #     row.map! { |mark| mark.to_s }
  #     puts row
  #   end
  # end

  def display(board)
    board.display
  end

end
