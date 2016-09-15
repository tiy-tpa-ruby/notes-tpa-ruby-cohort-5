# Make a variable called `name` with your name as a string

# Make a variable called `favorite_number` with your favorite number as an integer

# Make a variable called `sentence`, using string-interpolation with
# My name is _____ and my favorite number is ______

# Use the programmers print to output the value of sentence

# Create a variable called `numbers` with six of your favorite numbers

# Create a varible called `third_number` and assign it the third number
# of the array, using array indexing

# Create a variabled called `details` as a hash with key
# of "name" and value of your name and a key of "favorite_number"
# and a value of your favorite number

# Create a variable named `next_name` to use hash indexing
# to fetch the key for the name from the `details` hash

# Create a hash called `other_details` with a key of
# "color" and a value of "Blue" and a key of "score"
# and a value of 99

# Use hash indexing to retrieve the "score" and assign
# it to a variable `score`

# Fetch the value out of the `symbol_details` for
# the grade.
symbol_details = { "student" => "Jason", grade: "B" }

# Create a method called `about` that returns your name

# Create a method called `about_me` that takes an argument
# called `elementary_school` and returns a string saying
# I went to _____
# using string interpolation

# Call that method with the value of the name of your
# Elementary school

# Define a class named Person with attributes of name and hair_color

# Update the Person class to *require* a name and hair color for
# every object we create

# Create a person with the name "Gavin Stark" and hair color of "brown"

# Use the `p` (programmer's print) to print out the person's name
# Use the `p` (programmer's print) to print out the person's hair color

# Change the person's hair color to green

params = { "colors" => ["Red", "Green", "Blue"], "score" => 100}
# Fetch the colors from this hash into a variable named `colors`
# Use iteration to loop through the colors and print them

params = { "names" => %w{Gavin Jason Toni}, "scores" => [100,90,50] }
# Use iteration to loop through the names and print them
# Use iteration to loop through the scores and print them

params = { "people" => [{ "name" => "Gavin", "score" => 100 },
                        { "name" => "Jason", "score" => 99 },
                        { "name" => "Toni",  "score" => 101 }],
           "games" => [6, 8, 10] }

# Iterate through all the people and print out a string saying
# their name and their score. Maybe in the form
# "The score for ___ is ___"
