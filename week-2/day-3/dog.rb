class Dog
  attr_accessor :age, :sound, :color, :size

  def initialize(age)
    @age = age
  end

  def good_dog
    case sound
    when "woof"
      puts "I'm a good dog"
    when "bark"
      puts "I am a bad dog"
    when "WOOF"
      puts "I am a loud dog"
    when "ruff"
      puts "I am a cute dog"
    when /.*e.*/
      puts "I have an e in my sound"
    else
      puts "I make no sound"
    end

    # if sound == "woof"
    #   puts "I'm a good dog"
    # elsif sound == "bark"
    #   puts "I am a bad dog"
    # elsif sound == "WOOF"
    #   puts "I am a loud dog"
    # elsif sound == "ruff"
    #   puts "I am a cute dog"
    # end
  end
end

class Dachshund < Dog
  def size
    return "small"
  end

  def stubborn?
    return true
  end
end

riley = Dachshund.new(1)
riley.sound = "earfull"

roscoe = Dachshund.new(7)
roscoe.sound = "WOOF"

our_dogs = [riley, roscoe]
p our_dogs
