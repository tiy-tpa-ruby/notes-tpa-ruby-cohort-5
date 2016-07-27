class Game
  attr_accessor :number, :count

  def initialize
    puts "Game starting"
    self.number = rand(1..100)
    self.count = 0
  end

  def self.banner
    puts "------ GAME ------"
  end

  def prompt
    puts "What is your guess"
    input = gets.chomp

    input.to_i
  end

  def check_guess(guess_to_check)
    if guess_to_check < number
      puts "Too low"
    end

    if guess_to_check > number
      puts "Too high"
    end

    if guess_to_check == number
      puts "You are correct, in only #{count} tries"
      exit
      # never happens
    end
  end

  def play
    loop do
      guess = prompt
      self.count += 1

      if count > 5
        puts "You lose"
        return
      end

      check_guess(guess)
    end
  end
end

Game.banner

our_game = Game.new
puts "CHEAT MODE: #{our_game.number}"
our_game.play
