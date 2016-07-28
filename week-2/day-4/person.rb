class Person
  attr_accessor "instance_variable_name"

  def initialize(argument_name)
    @instance_variable_name = argument_name
  end
end

@people = []

puts "Give me a name"
local_variable_name = gets.chomp
person = Person.new(local_variable_name)
@people << person
puts "Thanks for playing"
