class RPNCalculator
  # TODO: your code goes here!
  def initialize
    @value = 0
    @stack = []
  end

  def value
    @value
  end

  def push(num)
    @stack << num
  end

  def pop
    @stack.pop
  end

  def check_size
    raise "calculator is empty" if @stack.length < 2
  end

  def plus
    check_size
    @value = (pop + pop)
    push(@value)
  end

  def minus
    check_size
    @value = (pop - pop) * -1
    push(@value)
  end

  def times
    check_size
    @value = (pop * pop)
    push(@value)
  end

  def divide
    check_size
    second = pop.to_f
    @value = (pop / second)
    push(@value)
  end

  def tokens(string)
    tokens = []
    symbols = ["+", "-", "*", "/"]
    string.split.each do |token|
      if symbols.include?(token)
        token = token.to_sym
      else
        token = token.to_i
      end
      tokens << token
    end
    tokens
  end

  def evaluate(string)
    tokens = tokens(string)
    tokens.each do |token|
      push(token) if token.class == Fixnum
      plus if token == :+
      minus if token == :-
      times if token ==:*
      divide if token == :/
    end
    @value
  end

end
