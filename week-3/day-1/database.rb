class Person
  attr_accessor :name, :salary, :position
end

class Database
  def initialize
    @people = []
    person = Person.new
    person.name = "Gavin"
    person.salary = 1_000_000
    person.position = "Instructor"
    @people << person

    person.name = "Jason"
    person.salary = 1_000_000
    person.position = "Instructor"
    @people << person

    person.name = "Toni"
    person.salary = 1_000_000
    person.position = "CD"
    @people << person
  end

  def search
    # prompt for a name
    puts "Enter a name:"
    name_to_find = gets.chomp

    # look for that person in the database
    # if found
    #   print details
    # else
    #   print sorry message
    # end
  end
end

database = Database.new
database.search
