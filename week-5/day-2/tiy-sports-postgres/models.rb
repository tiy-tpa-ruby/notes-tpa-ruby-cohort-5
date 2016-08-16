require 'pg'
require 'active_record'

ActiveRecord::Base.logger = Logger.new(STDOUT)

if ENV["DATABASE_URL"]
  # Production
  ActiveRecord::Base.establish_connection(ENV["DATABASE_URL"])
else
  # Development
  ActiveRecord::Base.establish_connection(
    adapter: "postgresql",
    database: "tiysports_development"
  )
end

class Sponsor < ActiveRecord::Base
  has_many :teams
end

# Implies there is a table named "players" (plural)
class Player < ActiveRecord::Base
  # Make sure every player has a name
  validates :name, presence: true, uniqueness: true, length: { in: 6..20 }
  validates :age, presence: true

  # automagically creates accessors for all of the columns
end

class Team < ActiveRecord::Base
  # Because team has a sponsor_id column, we tell active record
  # you can link to the sponsors table via "sponsor_id" and the
  # method we get is `sponsor`
  belongs_to :sponsor
end
