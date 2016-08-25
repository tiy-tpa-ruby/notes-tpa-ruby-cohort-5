json.extract! player, :id, :name, :age, :shirt_size, :birthday, :created_at, :updated_at
json.url player_url(player, format: :json)