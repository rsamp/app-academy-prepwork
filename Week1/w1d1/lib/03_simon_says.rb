def echo(word)
  "#{word}"
end

def shout(word)
  "#{word.upcase}"
end

def repeat(word, num_times = 2)
  phrase = ""
  num_times.times { phrase += "#{word} " }
  phrase.chomp(" ")
end

def start_of_word(word, num_chars)
  word[0, num_chars]
end

def first_word(phrase)
  phrase.split[0]
end

def titleize(title)
  little_words = ["and", "the", "over"]
  title = title.split
  title.each_with_index { |word, i| word.capitalize! unless
                              little_words.include?(word) && i != 0 }
  title.join(" ")
end
