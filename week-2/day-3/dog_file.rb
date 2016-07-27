class Dog
  attr_accessor :age, :sound, :color, :size

  def initialize(age)
    @age = age
  end

  def good_dog(file)
    case sound
    when "woof"
      file.puts "I'm a good dog"
    when "bark"
      file.puts "I am a bad dog"
    when "WOOF"
      file.puts "I am a loud dog"
    when "ruff"
      file.puts "I am a cute dog"
    when /.*e.*/
      file.puts "I have an e in my sound"
    else
      file.puts "I make no sound"
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

puts "Welcome to our Dog Database"

riley = Dachshund.new(1)
riley.sound = "WOOF"

roscoe = Dachshund.new(7)

finn = Dog.new(1.5)
finn.sound = "bark"

# Create a file of dog messages in "email.txt", "a"ppending as we go
# File.open("email.txt", "a") do |file|
#   our_dogs = [riley, roscoe, finn]
#   for dog in our_dogs
#     dog.good_dog(file)
#   end
# end

# Read the entire contents of "email.txt" into the variable email_txt_string
# email_txt_string = File.read("email.txt").chomp
# p email_txt_string

# Read the contents line-by-line into an array called email_txt_array
# email_txt_array = File.readlines("email.txt")
# for line in email_txt_array
#   puts line
# end

# Read the contents line-by-line and do the loop for each line
File.foreach("email.txt") do |line|
  puts line
end
