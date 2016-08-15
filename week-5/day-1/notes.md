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

- Where we are going
  - Data validation
  - More complex ActiveRecord relationships
  - Postgres
  - Migrations
  - Rails
  - Authentication / Authorization
  - APIs
  - Deploying to `production`
  - JavaScript
  - CoffeeScript
  - Testing

# Moving away from sqlite to a _real_ database

## Postgres:
- Installing the database engine
  - # Install the engine itself
  - `brew install postgresql`
  - # Install an improved command line interface
  - `brew install pgcli`
  - # Create a new database setup for the db
  - `createdb name_development`
- Changing our SQL code to the Postgres syntax
  - Create table is slightly different
  - `char(100)` or `varchar` instead of `string`
  - Auto increment id syntax is different too
  - Have to use 'single quotes' for values otherwise it thinks
    we are specifying a table name

- Creating table:
 - `CREATE TABLE teams(id SERIAL PRIMARY_KEY, name CHAR(100));`
- Inserting into table:
 - `insert into teams(name) VALUES('TIY Football');`
- Recreating our SQL statements to build/populate tiysports.db
- psql tiysports_development < tiysports.sql
- NOTE: Lookup how to redirect with pgcli

# bundler

- Tool for managing collection of gems required to run a project
- [bundler.io](http://bundler.io)
- Create a `Gemfile` at the root of your project
- First line should be `source 'https://rubygems.org'`
- Then add each gem we use as:  `gem "name"`
- e.g.
  ```
  source 'https://rubygems.org'
  gem 'sinatra'
  gem 'sinatra-contrib'
  gem 'haml'
  gem 'pg'
  ```
- Always commit `Gemfile` and `Gemfile.lock` to git!

# Setup for using postgres from Ruby
- Add the `pg` gem for Postgres
- Change our `adapter` to `postgresql` from `sqlite3`
- Change our `database` to `tiysports_development`

# Moving away from hard coded SQL for creating databases/tables

- Introduces `standalone_migrations`
- Add `gem 'standalone_migrations'` to `Gemfile`
- Create a `Rakefile` at root of project with
  ```
  require 'standalone_migrations'
  StandaloneMigrations::Tasks.load_tasks
  ```
- Add a file `db/config.yml` with contents:
  ```
  development:
    adapter: "postgresql"
    database: "tiysports_development"
  ```
- Now we can run `rake -T` or `bundle exec rake -T` to see all the `tasks` we have
- First we have is: `rake db:create` to build our database
  - We also have `rake db:drop` and we also don't have to care about the command line syntax
- Now we can use _migrations_ to create our tables or modify them.
- `rake db:new_migration name=create_teams`
  - Creates a new file in `db/migrate` folder that is timestamped and has `create_players` in the name.
  - Also automatically adds syntax to create a table! (nice!)
  ```
  class CreatePlayers < ActiveRecord::Migration
    def change
      create_table :players do |t|
        t.string :name
        t.integer :age
        t.string :shirt_size
        t.date :birthday

        t.timestamps
      end
    end
  end
  ```
  - We add the syntax internally to define the structure of the table
- We can also create migrations to add columns, remove columns, drop tables.

Resources
- [ActiveRecord Migrations](http://guides.rubyonrails.org/active_record_migrations.html)
  - Any of the syntax that is `bin/rails` won't work.
- [Standalone Migrations](https://github.com/thuss/standalone-migrations)
- [Bundler](http://bundler.io)
