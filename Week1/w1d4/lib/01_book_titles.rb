class Book
  # TODO: your code goes here!

  attr_reader :title

  $small_words = ["a", "an", "and", "of", "in", "the"]

  def title=(title)
    @title = title
    title_words = title.split
    title_words.each_with_index do |word, i|
      word.capitalize! unless $small_words.include?(word) && i != 0
    end
    @title = title_words.join(" ")
  end
end
