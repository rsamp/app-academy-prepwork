class Board
  attr_reader :grid

  def self.default_grid
    Array.new(10) { Array.new(10) }
  end

  def initialize(grid=self.class.default_grid)
    @grid = grid
  end

  def [](pos)
    grid[pos[0]][pos[1]]
  end

  def []=(pos,sym)
    grid[pos[0]][pos[1]] = sym
  end

  def count
    grid.flatten.count(:s)
  end

  def empty?(space=nil)
    return count==0 if space.nil?
    self[space].nil?
  end

  def full?
    size = grid.flatten.length
    count == size
  end

  def place_random_ship
    raise "board full" if full?
    row = rand(grid.length)
    column = rand(grid[0].length)
    pos = [row, column]
    self[pos] = :s
  end

  def won?
    count == 0
  end
end
