require "refile"
if Rails.env.production?
  Refile.configure do |config|
    config.store = Refile::Postgres::Backend.new(ActiveRecord::Base.connection.raw_connection)
  end
end
