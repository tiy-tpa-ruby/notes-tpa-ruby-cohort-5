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
    found_people = @people.select { |person| person.name.include?(name_to_find) }

    # Better: if found_person

    # if found
    if !found_people.empty?
      # Go through all those found people
      found_people.each do |person|
        #   and print details
        puts "Details about #{person.name}. They make #{person.salary} dollars"
      end
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
