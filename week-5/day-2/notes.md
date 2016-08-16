- Where we have been
  - Basic Ruby
  - Structures (arrays, hashes)
  - Classes
  - Enumerable
  - The Web
  - HTTP
  - HTML + CSS
  - ERB (and a little HAML)
  - SQL
  - ActiveRecord
  - Data validation
  - More complex ActiveRecord relationships
  - Postgres
  - Migrations

# Deploying to Heroku
- Make sure your project is a git repository
- Make sure all your files are added/committed
- If your project is not a Rails app:
  - Add a `Procfile` to the root of your directory with: `web: ruby path_to_my_code.rb` where `path_to_my_code` is the name of the code to start your app
- Update your manual `ActiveRecord::Base.establish_connection code to use `ENV["DATABASE_URL"]`
- `heroku create`
- `git push heroku master`
- Migrate your database in production if needed
  - `heroku rake db:migrate`
- How to look at errors:
  - `heroku logs`

# Welcome to Rails!

## Creating a new rails app

- `rails new NAME --database=postregesql`
- Makes a new rails app in a subdirectory
- To start working in the rails app
  - `cd NAME`
  - Start a second terminal
  - One terminal is for `rails server` to run the rails app
  - The other is for running rails/rake commands
- Run `rails db:create` to make sure your local database is created
- Rails apps by default run on port `3000`
- Visit `localhost:3000` to see your app running
- Let's add some `scaffold` to our app.
  - Scaffold creates the boilerplate for the following
    - Migration to create tables
    - Model files
    - View templates (ERB)
    - Controller (code to handle requests)
  - This creates *all* the work we did in our Sinatra style app

# Resources
- [Getting Started With Rails](http://guides.rubyonrails.org/getting_started.html)
  - This avoids using scaffold so you see all the details you need to code yourself (scaffold is the shortcut way)
  - Skip 9.1
- [Rails Routing](http://guides.rubyonrails.org/routing.html)  
  - Read 1, 2.1, 2.2, 2.3, 2.4
  - Feel free to read more, but it gets more complex than we are needing to handle yet
