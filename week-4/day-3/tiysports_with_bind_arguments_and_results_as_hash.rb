require 'sqlite3'

database = SQLite3::Database.new("tiysports.db")
database.results_as_hash = true

puts "Enter an age"
age = gets.chomp

# Lets the database do what it is best at (finding records)
puts "Only the players older than 30:"
rows = database.execute("select * from players where age > ?", [age])
rows.each do |row|
  name = row["name"]
  address = row["address"]
  puts "#{name} lives at #{address}"
end
