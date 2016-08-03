require "csv"
require "erb"

class People
  attr_accessor :name, :phone, :address, :position, :salary, :github

  def initialize(name)
    @name = name
  end
end

class Menu
  def initialize
    @people = []

    CSV.foreach("employees.csv", { headers: true, header_converters: :symbol }) do |employee|
      person = People.new(employee)

      person.name     = employee[:name]
      person.phone    = employee[:phone]
      person.address  = employee[:address]
      person.position = employee[:position]
      person.salary   = employee[:salary].to_i
      person.github   = employee[:github]

      @people << person
    end
  end

  def prompt
    loop do
      puts "A for Add a person"
      puts "S for Search for a person"
      puts "D for Delete a person"
      puts "R for Employee Report"
      puts "E for Exit"

      choice = gets.chomp
      break if choice == "E"

      case choice
      when "A"
        add_person
      when "S"
        search_person
      when "D"
        delete_person
      when "R"
        report
      else
        puts "These are your only options"
      end
    end
  end

  def write
    CSV.open("employees.csv", "w") do |csv|
      csv << %w{name phone address position salary github}
      @people.each do |person|
        csv << [person.name, person.phone, person.address, person.position,person.salary, person.github]
      end
    end
  end

  def add_person
    puts "Enter employee first and last name"
    name = gets.chomp

    person = People.new(name)

    person.name = name

    puts "Enter employee phone number"
    person.phone = gets.chomp

    puts "Enter employee address"
    person.address = gets.chomp

    puts "Employee's position"
    person.position = gets.chomp

    puts "Employee's salary"
    person.salary = gets.chomp.to_i

    puts "Employee's github account"
    person.github = gets.chomp

    @people << person

    write
    puts "#{@people [-1].name} has been added to your database."
  end

  def found(person)
    puts "Employee is listed:
          #{person.name}
          #{person.phone}
          #{person.address}
          #{person.position}
          #{person.salary}
          #{person.github}"
  end

  def search_person
    puts "Whom is it for which you look?"
    search_person = gets.chomp
    matching_person = @people.find { |person| person.name == search_person }
    if !matching_person.nil?
      found(matching_person)
    else puts "#{search_person}not found"
    end
  end

  def delete_person
    puts "Delete which Employee? "
    delete_employee = gets.chomp
    matching_person = @people.find { |person| person.name == delete_person }
    for person in @people
      if !matching_person.nil?
        @people.delete(matching_person)
        write
        puts "#{person.name} has been deleted."
        break
      else
        puts "Person not found"
      end
    end
  end

  # This method *takes* a position as an *argument*
  # and *returns* the number of entries in @people
  # that have that position
  def employee_count(search_position)
    number_of_people_with_position = @people.count { |person| person.position == search_position }
  end

  # This method *takes* a position as an *argument*
  # and returns the minimum salary of all people
  # that have that position
  def minimum_salary(search_position)
    matching_people = @people.select { |person| person.position == search_position }

    person_with_smallest_salary = matching_people.min_by { |person| person.salary }

    return person_with_smallest_salary.salary
  end

  def minimum_salary_by_using_map_and_min(search_position)
    matching_people = @people.select { |person| person.position == search_position }

    salaries = matching_people.map { |person| person.salary }

    smallest_salary = salaries.min

    return smallest_salary
  end

  # This method *takes* a position as an *argument*
  # and returns the maximum salary of all people
  # that have that position
  def maximum_salary(search_position)
    matching_people = @people.select { |person| person.position == search_position }

    person_with_largest_salary = matching_people.max_by { |person| person.salary }

    return person_with_largest_salary.salary
  end

  # This method *takes* a position as an *argument*
  # and returns the average salary of all people
  # that have that position
  def average_salary(search_position)
    matching_people = @people.select { |person| person.position == search_position }

    salaries = matching_people.map { |person| person.salary }

    # Old fashion way
    total = 0
    salaries.each do |salary|
      total = total + salary
    end

    # or use inject to add them all up
    total = salaries.inject(:+)

    average = total / salaries.count

    return average
  end

  # This method *takes* a position as an *argument*
  # and *returns* a String with the names of entries
  # in @people that have that position, combined by commas
  def employee_names(search_position)
    matching_people = @people.select { |person| person.position == search_position}

    names = matching_people.map { |person| person.name }

    combined_names = names.join(",")

    return combined_names
  end

  # How you will start to write this after graduation.
  # Learning ruby style is part of the path from junior to mid.
  def employee_names_ruby_style(search_position)
    @people.select { |person| person.position == search_position}.
            map { |person| person.name }.
            join(",")
  end

  # even more ruby style.
  def employee_names_even_more_ruby_style(search_position)
    @people.select { |person| person.position == search_position}.
            map(&:name).
            join(",")
  end

  def report
    puts "An employee report is being created for you now"

    # Read the template.html.erb and shove it into a variable
    # called html_template_from_disk.
    html_template_from_disk = File.read("template.html.erb")

    # Make a new ERB object and give it the `String` from html_template_from_disk
    erb_template = ERB.new(html_template_from_disk)

    # Make an array of the positions (dummy data for now)
    positions = ["Prime Minister", "President", "Campus Director", "Vice President", "Senator", "Programmer", "Instructor", "Lorem Ipsum"]

    # Get the *REAL* positions
    positions = @people.map { |person| person.position }

    # Remove duplicates
    positions.uniq!

    # Do the "mail merge" like `magic`
    output = erb_template.result(binding)

    # Write that out to a report.html file
    File.open("report.html", "w") do |file|
      file.puts output
    end
  end
end

menu = Menu.new()
menu.prompt
