class Friend
  # TODO: your code goes here!
  def greeting(who = nil)
    return "Hello!" unless who
    "Hello, #{who}!"
  end
end
