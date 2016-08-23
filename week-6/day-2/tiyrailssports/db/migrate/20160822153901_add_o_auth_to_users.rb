class AddOAuthToUsers < ActiveRecord::Migration[5.0]
  def change
    # Which provider are we using (e.g. github, facebook, twitter)
    add_column :users, :provider, :string

    # User id at the provider (e.g. github/facebook/twitter)
    add_column :users, :uid, :string

    # User's name at the provider
    add_column :users, :nickname, :string

    # Secret token identifying us to the provider
    # KEEP THIS SECRET
    add_column :users, :access_token, :string
  end
end
