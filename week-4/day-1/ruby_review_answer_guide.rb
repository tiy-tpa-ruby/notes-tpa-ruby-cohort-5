name = "Gavin"

favorite_number = 42

sentence = "My name is #{name} and my favorite number is #{favorite_number}"

p sentence
puts sentence.inspect

numbers = [1, 7, 8, 42, 11, 4]
third_number = numbers[2]

details = { "name" => "Gavin", "favorite_number" => 42 }

next_name = details["name"]

other_details = { "color" => "Blue", "score" => 99 }

score = other_details["score"]

symbol_details = { "student" => "Jason", grade: "B" }

grade = symbol_details[:grade]

tricky = { 42 => "favorite number", 99 => "score" }

answer = tricky[42]

adam = { 1 => "one", 2 => "two", 3 => "three" }
answer_one = adam[1]
answer_two = adam[2]
answer_answer = adam[3]

def about
  "Gavin"
end

def about_me(elementary_school)
  return "Gavin went to #{elementary_school}"
end

about_me("Northwest Elementary")

class Person
  attr_accessor :name, :hair_color

  def initialize(new_name, new_hair)
    @name = new_name
    @hair_color = new_hair
  end
end

gavin = Person.new("Gavin Stark", "brown")
p gavin.name
p gavin.hair_color

gavin.hair_color = "green"

params = { "colors" => ["Red", "Green", "Blue"], "score" => 100}
colors = params["colors"]
colors.each do |color|
  puts "The color is #{color}"
end

params = { "names" => %w{Gavin Jason Toni}, "scores" => [100,90,50] }
names = params["names"]
names.each do |name|
  puts name
end
scores = params["scores"]
scores.each do |score|
  puts score
end
# "One liner" style, or "no need to create local variable `names`"
params["names"].each do |name|
  puts name
end

params = { "people" => [{ "name" => "Gavin", "score" => 100 },
                        { "name" => "Jason", "score" => 99 },
                        { "name" => "Toni",  "score" => 101 }],
           "games" => [6, 8, 10] }

# Iterate through all the people and print out a string saying
# their name and their score. Maybe in the form
# "The score for ___ is ___"

people = params["people"]
people.each do |person|
  name = person["name"]
  score = person["score"]
  # What type of object is person here? => Hash
  puts "The score for #{name} is #{score}"
end
