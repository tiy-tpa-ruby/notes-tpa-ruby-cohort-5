SCORE = 100

class Menu
  PREFIX = "Dear human please give me your"

  def prompt
    puts "#{PREFIX} name (score: #{SCORE})"
    name = gets.chomp

    puts "#{PREFIX} phone number"
    phone = gets.chomp

    puts "#{PREFIX} salary"
    salary = gets.chomp
  end
end

p Math::PI
p Menu::PREFIX
menu = Menu.new
menu.prompt
