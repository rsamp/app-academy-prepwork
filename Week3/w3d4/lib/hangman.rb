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
    guess = guesser.guess
    correct_guess_indices = referee.check_guess(guess)
    update_board(guess, correct_guess_indices)
    guesser.handle_response
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
  attr_reader :dictionary, :secret_word, :length

  def initialize(dictionary)
    @dictionary = dictionary
    @length = 0
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
    length
  end

  def guess
    gets.chomp[0] # only accepts first letter typed in
  end

  def handle_response

  end
end
