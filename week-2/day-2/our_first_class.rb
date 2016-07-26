class Dog
  attr_accessor :age, :sound, :color, :size

  # replaces
  #
  # | | | |
  # VVVVVVV
  # def age
  #   @age
  # end
  # def age=(new_age)
  #   @age = new_age
  # end
  # def sound
  #   @sound
  # end
  # def sound(new_sound)
  #   @sound = new_sound
  # end
  # def color
  #   @color
  # end
  # def color(new_color)
  #   @color = new_color
  # end

  def initialize(age)
    @age = age
  end

  def good_dog
    if @sound == "woof"
      puts "I'm a good dog"
    else
      puts "I am a bad dog"
    end
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
riley.color = "Red"
riley.size = "big"
p "Riley is #{riley.age} and is color #{riley.color}"
p "Is Riley a dog?"
p riley.is_a?(Dog)
p "Is Riley a Dachshund"
p riley.is_a?(Dachshund)
p "Riley is a #{riley.size} dog"
p "Is Riley stubborn: #{riley.stubborn?}"

finn = Dog.new(1.5)
finn.size = "BIG"
p "Finn is a #{finn.size} dog"
p "Is Finn stubborn: #{finn.stubborn?}"

def prompt_for_a_new_dog
  puts "What is the age of the new dog?"

  input = gets
  input = input.chomp
  age = input.to_f
  new_dog = Dog.new(age)

  return new_dog
end

riley = prompt_for_a_new_dog
riley.sound = "woof"
riley.color = "White and Red"
p "Riley: #{riley.age} and goes #{riley.sound} and is #{riley.color}"

riley.color = "Brown"

p "Riley is now #{riley.color}"

roscoe = prompt_for_a_new_dog
roscoe.sound = "bark"
roscoe.color = "Red"
p "Roscoe: #{roscoe.age} and goes #{roscoe.sound} and is #{roscoe.color}"

riley.good_dog
roscoe.good_dog

finn = prompt_for_a_new_dog
p "Finn is"
p finn.age
finn.good_dog
