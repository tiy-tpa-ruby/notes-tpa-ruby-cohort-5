
def instructorish(instructor_name)
  p "The instructor name is"
  p instructor_name

  # Shorthand for the above debugging
  puts "The instructor_name is #{instructor_name.inspect}"

  if instructor_name == "Gavin" ||
     instructor_name == "Jason" ||
     instructor_name == "Gabe"
    puts "Hooray"
    puts "This person is an instructor"
  else
    puts "Awwwwww"
    puts "This person is not an instructor (yet)"
  end
end

people = []
loop do
  name = gets.chomp
  if name.empty?
    break
  else
    people << name
    instructorish(name)
  end
end

p people
puts "All done"
