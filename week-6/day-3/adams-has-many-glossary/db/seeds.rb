# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.create(name: "Front End Engineering",
                subject: "Javascript")

Category.create(name: "Back End Engineering",
                subject: "Ruby")

Term.create(name: "Active record",
            definition: "an ORM for ruby",
            author: "David Heinemeier Hansson",
            category_id: 2,
            web_link: "http://goo.gl/dbXsUX")

Term.create(name: "Modules",
            definition: "a way of grouping together methods, classes, and constants",
            author: "Andy Hunt, Dave Thomas",
            category_id: 2,
            web_link: "http://goo.gl/cee6oc")

Term.create(name: "Ruby Tk",
            definition: "a graphical user interface (GUI) for Ruby",
            author: "David Heinemeier Hansson",
            category_id: 2,
            web_link: "http://goo.gl/JD1zMe")

Term.create(name: "Strings",
            definition: "Strings are text. They are denoted by surrounding text with either single or double quotes",
            author: "MDN Mozilla Developer Network",
            category_id: 1,
            web_link: "https://goo.gl/auKju")

Term.create(name: "Classes",
            definition: "Classes are a template to create many objects with similar qualities",
            author: "MDN Mozilla Developer Network",
            category_id: 1,
            web_link: "https://goo.gl/4yX6jM")

Term.create(name: "Ternary Operator",
            definition: "The ternary operator is usually used as a shortcut for the if statement",
            author: "MDN Mozilla Developer Network",
            category_id: 1,
            web_link: "https://goo.gl/zdZXj")
