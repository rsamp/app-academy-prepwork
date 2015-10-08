# I/O Exercises
#
# * Write a `guessing_game` method. The computer should choose a number between
#   1 and 100. Prompt the user to `guess a number`. Each time through a play loop,
#   get a guess from the user. Print the number guessed and whether it was `too
#   high` or `too low`. Track the number of guesses the player takes. When the
#   player guesses the number, print out what the number was and how many guesses
#   the player needed.
# * Write a program that prompts the user for a file name, reads that file,
#   shuffles the lines, and saves it to the file "{input_name}-shuffled.txt". You
#   could create a random number using the Random class, or you could use the
#   `shuffle` method in array.

def guessing_game
  number = rand(1..100)
  guesses = 0
  guess = nil
  puts "Guess a number: "

  until guess == number
    guess = gets.to_i
    guesses+=1
    puts "#{guess} is too low. Guess again: " if guess < number
    puts "#{guess} is too high. Guess again: " if guess > number
  end

  puts "#{guess} is correct and it took #{guesses} guesses."
end

def file_shuffler
  puts "Please provide file name: "
  file = gets.chomp
  base = File.basename(file, ".*")
  extension = File.extname(file)
  shuffled = File.open("#{base}-shuffled#{extension}", "w") do |shuffled_line|
    File.readlines(file).shuffle.each do |original_line|
      shuffled_line.puts original_line.chomp
    end
  end
end

if $PROGRAM_NAME == __FILE__
  file_shuffler
end
