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

    person = Person.new
    person.name = "Jason"
    person.salary = 2_000_000
    person.position = "Instructor"
    @people << person

    person = Person.new
    person.name = "Toni"
    person.salary = 3_000_000
    person.position = "CD"
    @people << person
  end

  def search
    # prompt for a name
    puts "Enter a name:"
    name_to_find = gets.chomp

    # look for that person in the database
    # use some enumerable method that gives me back
    # the first person who's name matches the name
    # I am looking for

    # if found
    if @people.any? { |person| name_to_find == person.name }
      found_person = @people.find { |person| name_to_find == person.name }
      #   print details
      puts "Details about #{found_person.name}. They make #{found_person.salary} dollars"
    # else
    else
      #   print sorry message
      puts "Sorry..."
      # end
    end

  end
end

database = Database.new
database.search
