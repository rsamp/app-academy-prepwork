class Timer
  def initialize
    @seconds
  end

  def seconds
    @seconds = 0
  end

  def seconds=(seconds)
    @seconds = seconds
  end

  def time_string
    hours = (@seconds/3600).to_s
    hours.prepend("0") if hours.length == 1
    minutes = ((@seconds%3600)/60).to_s
    minutes.prepend("0") if minutes.length == 1
    seconds = ((@seconds%3600)%60).to_s
    seconds.prepend("0") if seconds.length == 1
    "#{hours}:#{minutes}:#{seconds}"
  end
end
