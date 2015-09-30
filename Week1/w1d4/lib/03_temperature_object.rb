class Temperature
  # TODO: your code goes here!
  def initialize(c_or_f)
    @c_or_f = c_or_f.keys[0].to_sym
    @temp = c_or_f[@c_or_f]
  end

  def in_fahrenheit
    return @temp if @c_or_f == :f
    ctof
  end

  def in_celsius
    return @temp if @c_or_f == :c
    ftoc
  end

  def self.from_celsius(temp)
    Temperature.new(:c => temp)
  end

  def self.from_fahrenheit(temp)
    Temperature.new(:f => temp)
  end

  def ftoc
    (@temp - 32) * 5.0/9.0
  end

  def ctof
    @temp * 9.0/5.0 + 32
  end

end

class Celsius < Temperature
  def initialize(temp)
    super({:c => temp})
  end
end

class Fahrenheit < Temperature
  def initialize(temp)
    super({:f => temp})
  end
end
