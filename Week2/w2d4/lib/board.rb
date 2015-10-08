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
    (0..grid[0].length-1).each do |i|   # each row
      uniq_arr = get_row(i).uniq     # squeeze it down to unique values (including nil)
      if uniq_arr[0] != nil && uniq_arr.length == 1
        return uniq_arr[0]
      end
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
    row_elements = []
    (0..grid[0].length-1).each do |i|
      row_elements << get_mark([row, i]) unless empty?([row, i])
    end
    row_elements
  end

  def get_col(col)
    col_elements = []
    (0..grid.length-1).each do |i|
      col_elements << get_mark([i, col]) unless empty?([i, col])
    end
    col_elements
  end

end
