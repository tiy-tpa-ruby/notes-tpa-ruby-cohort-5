# all?

collection = %w{Gavin Jason Toni}
is_it_true = collection.all? { |name| name.length > 3 }
puts "all? returned #{is_it_true}"

# any?

collection = %w{Gavin Jason Toni}
is_it_true = collection.any? { |name| name.start_with?("Ga") }
puts "any? is #{is_it_true}"

# count

collection = %w{Gavin Jason Toni Gavin}
long_name_count = collection.count { |name| name.length > 4 }
puts "count length > 4 is #{long_name_count}"
number_of_elements = collection.count
puts "The count is #{number_of_elements}"
# These two are equivalent but the first is shorthand
number_of_gavins = collection.count("Gavin")
number_of_gavins = collection.count { |name| name == "Gavin"}
puts "The count of Gavins is #{number_of_gavins}"

# each - main thing to know, everything else is built on each
collection = %w{Gavin Jason Toni}
collection.each do |name|
  puts "The name is #{name}"
end

# find
collection = %w{Gavin Jason Toni}
found_element = collection.find { |name| name.length == 4 }
puts "The first element with a name of length four is #{found_element}"

found_element = collection.find { |name| name.length == 5 }
puts "The first element with a name of length five is #{found_element}"

found_element = collection.find { |name| name.length == 6 }
puts "The first element with a name of length six is #{found_element.inspect}"

# map
collection = %w{Gavin Jason Toni}
mapped_elements = collection.map { |name| "#{name.upcase} has #{name.length} letters" }
puts "The mapped_elements are #{mapped_elements.inspect}"
puts "The collection is still #{collection}"

class Person
  attr_accessor :name, :salary
  def initialize(name, salary)
    @name = name
    @salary = salary
  end
end

objects_from_strings = collection.map { |name| Person.new(name, 100_000) }
puts "The objects_from_strings are #{objects_from_strings.inspect}"

# max
collection = %w{Jason Toni Gavin}
largest_name = collection.max
puts "The largest name is #{largest_name}"

# max_by
people = [Person.new("Jason", 500_000),
          Person.new("Gavin", 2_000_000),
          Person.new("Toni", 1_000_000)]
person_with_largest_salary = people.max_by { |person| person.salary }
puts "The person who is paid the most is #{person_with_largest_salary.inspect}"
person_whos_name_would_be_last_alphabetically = people.max_by { |person| person.name }
puts "The person whos name would be last at roll call is #{person_whos_name_would_be_last_alphabetically.inspect}"
person_whos_name_is_longest = people.max_by { |person| person.name.length }
puts "The person with the longest name is #{person_whos_name_is_longest.inspect}"

# min/min_by

# minmax_by
salaries = people.minmax_by { |person| person.salary }
puts "The people with the smallest and largest salaries are #{salaries.inspect}"

# none?
anyone_overpaid = people.none? { |person| person.salary > 3_000_000 }
puts "Nobody paid more than 3_000_000: #{anyone_overpaid}"

# one?
answer_with_name_length_four = people.one? { |person| person.name.length == 4 }
puts "One? name length is four #{answer_with_name_length_four}"
answer_with_name_length_five = people.one? { |person| person.name.length == 5 }
puts "One? name length is five #{answer_with_name_length_five}"
answer_with_name_length_six = people.one? { |person| person.name.length == 6 }
puts "One? name length is six #{answer_with_name_length_six}"

# reverse_each
collection = %w{Gavin Jason Toni}
collection.reverse_each do |name|
  puts "reverse listing of name: #{name}"
end
# Same as doing this:
collection.reverse.each do |name|
  puts "reverse listing of name: #{name}"
end

# select
over_paid_people = people.select { |person| person.salary >= 1_000_000 }
puts "These people are overpaid: #{over_paid_people.inspect}"

# reject
under_paid_people = people.reject { |person| person.salary >= 1_000_000 }
puts "These people are underpaid: #{under_paid_people.inspect}"
# this is the same as
under_paid_people = people.select { |person| person.salary < 1_000_000 }
puts "These people are underpaid: #{under_paid_people.inspect}"


# sort
collection = %w{Jason Toni Gavin}
sorted_collection = collection.sort
puts "The sorted collection is #{sorted_collection.inspect}"

# sort_by
sorted_by_salary = people.sort_by { |person| person.salary }
puts "The people in order by salary are: #{sorted_by_salary.inspect}"
sorted_by_name = people.sort_by { |person| person.name }
puts "The people in order by name are: #{sorted_by_name.inspect}"

# take
letters = %w{a b c d e f g h i j k l m n o p q r s t u v w x y z}
first_five_letters = letters.take(5)
puts "The first five letters are #{first_five_letters.inspect}"
first_one_hundred_letters = letters.take(100)
puts "The first one hundred letters are #{first_one_hundred_letters.inspect}"
first_two_hundred_letters = letters.cycle.take(200)
puts "The first two hundred letters (with cycling) are #{first_two_hundred_letters.inspect}"

# Get the top five paid people
top_paid_people = people.sort_by { |person| person.salary }.reverse.take(5)
