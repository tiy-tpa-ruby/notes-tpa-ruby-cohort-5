# rubocop:disable Style/EmptyLines
require 'sqlite3'

class Player
  attr_accessor :id, :name, :address, :shirt_size, :age, :birthday

  # Using the database, find all the players and return them
  # as an array of Player objects
  def self.all(database)
    select_from_database(database, "select * from players", [])
  end

  # Using the database, find all the players with the given name
  # and return them as an array of Player objects
  def self.all_by_name(database, name)
    select_from_database(database, "select * from players where name = ?", [name])
  end

  # Using the database, find all the players older than 'age'
  # and return them as an array of Player objects
  def self.players_older_than(database, age)
    select_from_database(database, "select * from players where age > ?", [age])
  end

  # Using the database, find all the players satisfying the supplied
  # query (and query_parameters) and return them as an array of
  # Player objects
  def self.select_from_database(database, query, query_parameters)
    # Make an empty array
    players = []

    # Lets the database do what it is best at (finding records)
    rows = database.execute(query, query_parameters)

    # For every row
    rows.each do |row|
      # Make a new player object
      player = Player.new

      # Fill in the player object's attr_accessors using
      # the Hash we got from the database, accessing each
      # column from the hash and put it in the corresponding
      # accessor
      player.id = row["id"]
      player.name = row["name"]
      player.address = row["address"]
      player.shirt_size = row["shirt_size"]
      player.age = row["age"]
      player.birthday = row["birthday"]

      # append that object to our collection of players
      players << player
    end

    # Return the players
    return players
  end
end






































database = SQLite3::Database.new("tiysports.db")
database.results_as_hash = true

all_players = Player.all(database)
puts "There are #{all_players.size} players in the database"
all_players.each do |player|
  puts "Player #{player.name} lives at #{player.address}"
end










puts "Enter an age"
age = gets.chomp

# Fragile (what if we drop the age column and use birthday to compute it)
# Player.select_from_database(database, "select * from players where age > 30")
selected_players = Player.players_older_than(database, age)

puts "There are #{selected_players.size} player older than #{age}"
p selected_players



puts "Enter a name"
name = gets.chomp

# Using our helper method select_from_database
selected_players_by_name = Player.select_from_database(database,"select * from players where name = ?", [name])

# Use a specificly created method to find players by name
# Works the same way, but not tightly coupled to the query
selected_players_by_name = Player.all_by_name(database, name)

p selected_players_by_name
