number = rand(1..100)

puts "CHEAT MODE: #{number}"
def prompt
  puts "What is your guess"
  input = gets.chomp

  input.to_i
end

def check_guess(guess_to_check, number_to_check)
  if guess_to_check < number_to_check
    puts "Too low"
  end

  if guess_to_check > number_to_check
    puts "Too high"
  end

  if guess_to_check == number_to_check
    puts "You are correct"
    exit
    # never happens
  end
end

count = 0
loop do
  guess = prompt
  count += 1

  if count > 5
    puts "You lose"
    exit
  end

  check_guess(guess, number)
end
