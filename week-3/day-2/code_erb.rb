require 'erb'

class Person
  attr_accessor :name, :salary, :position, :slack_account, :github_account
end

class Menu
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
    person.position = "Campus Director"
    @people << person
  end

  TEMPLATE = File.read("template.html.erb")

  def people_to_html(output_people)
    template = ERB.new(TEMPLATE)
    output = template.result(binding)
  end

  def search
    puts "Name? "
    search_name = gets.chomp

    found_person = @people.find { |person| person.name == search_name }
    if found_person
      File.open("search.html", "w") do |file|
        output_people = []
        output_people << found_person

        file.puts people_to_html(output_people)
      end
    else
      puts "Nope"
    end
  end

  def report
    File.open("report.html", "w") do |file|
      output_people = @people

      file.puts people_to_html(output_people)
    end
  end
end

menu = Menu.new
menu.report
