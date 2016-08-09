require 'sqlite3'

database = SQLite3::Database.new("tiysports3.db")

# All the players
puts "All the players:"
rows = database.execute("select * from players")
rows.each do |row|
  p row
end

puts "\n\n"

# Only the players older than 30 -- efficient
# Lets the database do what it is best at (finding records)
puts "Only the players older than 30:"
rows = database.execute("select * from players where age > 30")
rows.each do |row|
  p row
end

puts "\n\n"

puts "Oldest player:"
rows = database.execute("select max(age) from players")
rows.each do |row|
  p row
end

puts "\n\n"

# All the players older than 30, Ruby style -- inefficient
# We normally just use the database to do this work.
puts "All the players (Ruby style):"
rows = database.execute("select * from players")
# Rows is an array, where the age is index 4
selected_rows = rows.select { |row| row[4] > 30 }
selected_rows.each do |row|
  p row
end

puts "\n\n"

# Multiline query - that does a "join" to relate
# the players to the teams via the memberships
rows = database.execute %{
  select players.name, teams.mascot
  from players, teams, memberships
  where players.id = memberships.player_id and
        teams.id = memberships.team_id;
}

puts "Raw results for the `rows` for the roster query"
p rows

puts "\n\n"

puts "Roster"
# Rows is an array of arrays
# So when I `each` through `rows`, each `row` will be an array itself
rows.each do |row|
  # The 0th thing in the array is the player_name
  # The 1th thing in the array is the mascot
  player_name = row[0]
  mascot = row[1]
  puts "The player #{player_name} loves the mascot #{mascot}"
end
