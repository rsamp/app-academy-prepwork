class Board
  attr_reader :grid


  def initialize(grid=[[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]])
    @grid = grid
  end

  def place_mark(pos, mark)
    grid[pos[0]][pos[1]] = mark
  end

  def empty?(pos)
    get_mark(pos) == nil
  end

  def winner
    winner = nil
    (0..2).each do |i| # each row
      row_vals = get_row(i)
      if row_vals[0] == row_vals[1] && row_vals[0] == row_vals[2] && row_vals[0] != nil
        return row_vals[0]
      end
    end
    (0..2).each do |i| # each column
      col_vals = get_col(i)
      if col_vals[0] == col_vals[1] && col_vals[0] == col_vals[2] && col_vals[0] != nil
        return col_vals[0]
      end
    end
    diag_down = get_diag_down
    if diag_down[0] == diag_down[1] && diag_down[0] == diag_down[2] && diag_down[0] != nil
      return diag_down[0]
    end
    diag_up = get_diag_up
    if diag_up[0] == diag_up[1] && diag_up[0] == diag_up[2] && diag_up[0] != nil
      return diag_up[0]
    end
    winner
  end

  def over?
    if !grid.flatten.include?(nil) || winner != nil
      return true
    end
    false
  end

  def get_mark(pos)
    grid[pos[0]][pos[1]]
  end

  def get_row(row)
    flattened = grid.flatten  # [0,1,2,3,4,5,6,7,8]
    row_elements = []
    first_in_row = row*3      # 0, 3, or 6
    (first_in_row..first_in_row+2).each do |element|
      row_elements << flattened[element]
    end
    row_elements
  end

  def get_col(col)
    flattened = grid.flatten # [0,1,2,3,4,5,6,7,8]
    col_elements = []
    (0..2).each do |element|  # 0, 1, or 2
      col_elements << flattened[element*3+col]
    end
    col_elements
  end

  def get_diag_down
    flattened = grid.flatten
    return [flattened[0], flattened[4], flattened[8]]
  end

  def get_diag_up
    flattened = grid.flatten
    return [flattened[2], flattened[4], flattened[6]]
  end

  def display
    self.grid.each do |row|
      row.map! { |mark| mark.to_s }
      puts row
    end
  end

end

# if $PROGRAM_NAME == __FILE__
#   board = Board.new
# end
