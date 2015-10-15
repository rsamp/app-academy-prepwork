class Hangman
  attr_reader :guesser, :referee, :board

  def initialize(players={:guesser => HumanPlayer.new, :referee => HumanPlayer.new})
    @guesser = players[:guesser]
    @referee = players[:referee]
    @board = ""
  end

  def setup
    puts "Referee, pick secret word: "
    secret_word = referee.pick_secret_word
    guesser.register_secret_length(secret_word)
    puts "Length of secret word is #{secret_word}"
    secret_word.times do
      board << "_"
    end
    puts "Secret word: #{board}"
  end

  def take_turn
    guess = guesser.guess(board)
    correct_guess_indices = referee.check_guess(guess)
    update_board(guess, correct_guess_indices)
    guesser.handle_response(guess, correct_guess_indices)
  end

  def update_board(guess, indices)
    indices.each do |index|
      board[index] = guess
    end
  end
end

class HumanPlayer
end

class ComputerPlayer
  attr_reader :dictionary, :secret_word, :length, :candidate_dictionary, :guesses

  def initialize(dictionary)
    @dictionary = dictionary
    @length = 0
    @candidate_dictionary = dictionary
    @guesses = []
  end

  def pick_secret_word
    secret_word_index = rand(dictionary.length)
    @secret_word = dictionary[secret_word_index]
    @length = secret_word.length
  end

  def check_guess(letter)
    indices = []
    secret_word.split("").each_with_index do |char, i|
      indices << i if letter == char
    end
    indices
  end

  def register_secret_length(length)
    @length = length
    candidate_dictionary.each do |word|
      candidate_dictionary.delete(word) if word.length != length
    end
    length
  end

  def guess(board)
    letter_freq = Hash.new(0)
    candidate_dictionary.each do |word|
      word.each_char do |char|
        letter_freq[char]+=1
      end
    end  # at this point, a hash has been created with letters and their frequencies
    letter_freq.delete_if { |key,val| guesses.include?(key) || board.include?(key) }
    most_common = ""
    most_common_count = 0
    letter_freq.keys.each do |key|
      if letter_freq[key] > most_common_count
        most_common_count = letter_freq[key]
        most_common = key
      end
    end
    most_common
  end

  def handle_response(guess, correct_guess_indices)
    guesses << guess
    candidate_dictionary.each do |word|
      @secret_word = word
      candidate_indices = check_guess(guess)
      candidate_dictionary.delete(word) if correct_guess_indices != candidate_indices
    end
  end

  def candidate_words
    candidate_dictionary
  end


end
