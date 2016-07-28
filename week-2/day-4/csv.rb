require "csv"

class Person
  attr_accessor :name, :pin, :balance
end

# accounts = [
#   { name: "Sean, Person" , pin: 1234, balance: 400    },
#   { name: "Jamie", pin: 2345, balance: 6734   },
#   { name: "Liz"  , pin: 5678, balance: 50_000 },
#   { name: "Stan" , pin: 9012, balance: 122    },
#   { name: "Gavin" , pin: 1234, balance: 555   }
# ]

people = []
CSV.foreach("accounts.csv", { headers: true, header_converters: :symbol }) do |account|
  person = Person.new

  person.name    = account[:name]
  person.pin     = account[:pin]
  person.balance = account[:balance]

  people << person
end

people.each do |person|
  puts "I know about #{person.name}"
end

person = Person.new

puts "New name"
person.name = gets.chomp

puts "Pin"
person.pin = gets.chomp

puts "Balance"
person.balance = gets.chomp.to_i

people << person

CSV.open("accounts.csv", "w") do |csv|
  csv << ["name", "pin", "balance"]
  people.each do |person|
    csv << [person.name, person.pin, person.balance]
  end
end
