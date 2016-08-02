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

  def prints_person(file, person)
    file.puts %{
      <ul>
        <li>#{person.name}</li>
        <li>#{person.position}</li>
        <li>#{person.salary}</li>
        <li>#{person.github_account}</li>
        <li>#{person.slack_account}</li>
      </ul>
    }
  end

  HTML_TOP = %{
    <!DOCTYPE html>
    <html>
    <head>
      <meta charset="utf-8">
      <title></title>
    </head>
    <style media="screen">
      ul {
        list-style: none;
      }

      li {
        font-size: 2em;
      }
    </style>
    <body>
  }

  HTML_BOTTOM = %{
      </body>
    </html>
  }

  def search
    puts "Name? "
    search_name = gets.chomp

    found_person = @people.find { |person| person.name == search_name }
    if found_person
      File.open("search.html", "w") do |file|
        file.puts HTML_TOP
        prints_person(file, found_person)
        file.puts HTML_BOTTOM
      end
    else
      puts "Nope"
    end
  end

  def report
    File.open("report.html", "w") do |file|
      file.puts HTML_TOP
      @people.each do |person|
        prints_person(file, person)
      end
      file.puts HTML_BOTTOM
    end
  end
end

menu = Menu.new
menu.report
