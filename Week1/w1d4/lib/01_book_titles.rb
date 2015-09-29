class Book
  # TODO: your code goes here!
  def title
    self.map! do |word|
      word = word.capitalize
    end
  end
end
