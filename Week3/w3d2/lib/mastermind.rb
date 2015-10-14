class Code
  attr_reader :pegs

  PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow,
    "O" => :orange,
    "P" => :purple
  }

  def self.parse(pegs)
    code = []
    pegs.each_char do |char|
      char.upcase!
      if PEGS.has_key?(char)
        code << PEGS[char]
      else
        raise "error: unavailable peg color"
      end
    end
    Code.new(code)
  end

  def self.random
    random_pegs = PEGS.keys.sample(4)
    code = []
    random_pegs.each {|key| code << PEGS[key]}
    Code.new(code)
  end

  def initialize(code)
    @pegs = code
  end

  def [](i)
    @pegs[i]
  end

  def exact_matches(other_code)
    matches = 0
    [0..3].each do |i|
      # p self
      # p self[i]
      # p other_code
      # p other_code[i]
      matches+=1 if self[i] == other_code[i]
    end
    matches
  end

  def near_matches(other_code)

  end

  def ==(other_code)
    return false if !other_code.is_a?(Code)
    return true if self.pegs == other_code.pegs
    false
  end

end

class Game
  attr_reader :secret_code

  def initialize(code = Code.random)
    @secret_code = code
  end

  def get_guess
    Code.new(gets.chomp)
  end

  def display_matches(code)

  end

end
