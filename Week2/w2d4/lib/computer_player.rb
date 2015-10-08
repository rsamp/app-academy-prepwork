class ComputerPlayer
  attr_reader :name, :board

  def initialize(name)
    @name = name
  end

  def display(board)
    @board = board
  end

  def get_move
    winning_row_col_or_diag = find_winning_row_col_or_diag
    if winning_row_col_or_diag == ""
      empty_spaces = find_empty_spaces
      random_move = rand(0..empty_spaces.length - 1)
      return empty_spaces[random_move]
    else                                            # Winning move is available
      winning_space = []
      if winning_row_col_or_diag.start_with?("row")
        row = winning_row_col_or_diag[-1]
        winning_space << row
        winning_space << get_row(row).index(nil)
      elsif winning_row_col_or_diag.start_with?("col")
        col = winning_row_col_or_diag[-1]
        winning_space << get_col(col).index(nil)
        winning_space << col
      elsif winning_row_col_or_diag == "diag down"

      else                                          # Winning move is in diag up

      end
      winning_space
    end
  end

  def find_winning_row_col_or_diag
    winning_row_col_or_diag = ""
    (0..2).each do |i|
      row_vals = board.get_row(i)
      if row_vals.count {|el| el == :O} == 2 && row_vals.count {|el| el == nil} == 1
        winning_row_col_or_diag == "row #{i}"
      end
    end
    (0..2).each do |i|
      col_vals = board.get_col(i)
      if col_vals.count {|el| el == :O} == 2 && row_vals.count {|el| el == nil} == 1
        winning_row_col_or_diag == "col #{i}"
      end
    end
    diag_down = board.get_diag_down
    if diag_down.count {|el| el == :O} == 2 && diag_down.count {|el| el == nil} == 1
      winning_row_col_or_diag == "diag down"
    end
    diag_up = board.get_diag_up
    if diag_up.count {|el| el == :O} == 2 && diag_up.count {|el| el == nil} == 1
      winning_row_col_or_diag == "diag up"
    end
    winning_row_col_or_diag
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
