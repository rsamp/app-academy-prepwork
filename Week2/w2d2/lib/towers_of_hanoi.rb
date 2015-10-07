# Towers of Hanoi
#
# Write a Towers of Hanoi game:
# http://en.wikipedia.org/wiki/Towers_of_hanoi
#
# In a class `TowersOfHanoi`, keep a `towers` instance variable that is an array
# of three arrays. Each subarray should represent a tower. Each tower should
# store integers representing the size of its discs. Expose this instance
# variable with an `attr_reader`.
#
# You'll want a `#play` method. In a loop, prompt the user using puts. Ask what
# pile to select a disc from. The pile should be the index of a tower in your
# `@towers` array. Use gets
# (http://andreacfm.com/2011/06/11/learning-ruby-gets-and-chomp/) to get an
# answer. Similarly, find out which pile the user wants to move the disc to.
# Next, you'll want to do different things depending on whether or not the move
# is valid. Finally, if they have succeeded in moving all of the discs to
# another pile, they win! The loop should end.
#
# You'll want a `TowersOfHanoi#render` method. Don't spend too much time on
# this, just get it playable.
#
# Think about what other helper methods you might want. Here's a list of all the
# instance methods I had in my TowersOfHanoi class:
# * initialize
# * play
# * render
# * won?
# * valid_move?(from_tower, to_tower)
# * move(from_tower, to_tower)
#
# Make sure that the game works in the console. There are also some specs to
# keep you on the right track:
#
# ```bash
# bundle exec rspec spec/towers_of_hanoi_spec.rb
# ```
#
# Make sure to run bundle install first! The specs assume you've implemented the
# methods named above.

class TowersOfHanoi

  attr_accessor :towers

  def initialize
    t1 = [3, 2, 1]
    t2 = []
    t3 = []
    @towers = [t1, t2, t3]
  end

  def play
    render

    until won?
      puts "From tower:"
      from_tower = gets.to_i
      puts "To tower:"
      to_tower = gets.to_i
      move(from_tower, to_tower)
      puts "Invalid move" if !valid_move?(from_tower, to_tower)
      render
    end

    puts "You win!"
  end

  def render
    puts "Tower 0: #{towers[0].join(' ')}"
    puts "Tower 1: #{towers[1].join(' ')}"
    puts "Tower 2: #{towers[2].join(' ')}"
  end

  def won?
    return true if ((towers[1].empty? || towers[2].empty?) && towers[0].empty?)
    false
  end

  def valid_move?(from_tower, to_tower)
    return false if towers[from_tower].empty?
    return true if towers[to_tower].empty?
    return false if towers[from_tower][0] > towers[to_tower][0]
    return true
  end

  def move(from_tower, to_tower)
    towers[to_tower] << towers[from_tower].pop if valid_move?(from_tower, to_tower)
    towers
  end

end

if $PROGRAM_NAME == __FILE__
  TowersOfHanoi.new().play
end
