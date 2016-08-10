# rubocop:disable Style/EmptyLines
require 'sqlite3'
require 'active_record'

ActiveRecord::Base.logger = Logger.new(STDOUT)
ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: "tiysports.db"
)

# Implies there is a table named "players" (plural)
class Player < ActiveRecord::Base
  # automagically creates accessors for all of the columns
end

class Team < ActiveRecord::Base
end

# puts "Enter a team name"
# name = gets.chomp
#
# puts "Enter a mascot"
# mascot = gets.chomp
#
# puts "Enter a sport"
# sport = gets.chomp
#
# Team.create(name: name, sport: sport)

teams = Team.all
puts "There are #{teams.size} teams in our database"
teams.each do |team|
  puts "The team #{team.name} has the mascot #{team.mascot} and plays #{team.sport} and has ID of #{team.id}"
end

# Find using a where clause and a first to fetch the array and just give us the first item
# footies = Team.where(name: "TIY Footies").first
# Find exactly one object by id
# footies = Team.find(5)

# Find exactly one object by name
footies = Team.find_by(name: "TIY Footies")
if footies
  puts "Found the team! The mascot is currently #{footies.mascot}"

  puts "Enter a new mascot"
  mascot = gets.chomp
  footies.mascot = mascot

  footies.save
  puts "Hooray, now the mascot is #{footies.mascot}"
end


players = Player.all
puts "There are #{players.size} players in our database"
players.each do |player|
  puts "Player #{player.name} lives at #{player.address} born on #{player.birthday} and is #{player.age} old and wears a #{player.shirt_size}"
end

puts "Enter a lower age:"
age = gets.chomp

selected_players = Player.where("age > ?", age)
puts "There are #{players.size} players in our database older than #{age}"
selected_players.each do |player|
  puts "Player #{player.name} lives at #{player.address} born on #{player.birthday} and is #{player.age} old"
end

puts "Enter an upper age"
upper_age = gets.chomp

puts "Enter a shirt size"
persons_shirt_size = gets.chomp

selected_players = Player.where("age > ? AND age < ?", age, upper_age).where(shirt_size: persons_shirt_size)
selected_players.each do |player|
  puts "Player #{player.name} lives at #{player.address} born on #{player.birthday} and is #{player.age} old"
end









#
