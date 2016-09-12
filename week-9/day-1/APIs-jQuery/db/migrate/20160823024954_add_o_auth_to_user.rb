class AddOAuthToUser < ActiveRecord::Migration[5.0]
  def change
  end

  def up
    # provider is github
    add_column :users, :provider, :string

    # User id at the provider (e.g. github)
    add_column :users, :uid, :string

    # User's name at the provider
    add_column :users, :nickname, :string

    # Secret token identifying us to the provider
    # KEEP THIS SECRET
    add_column :users, :access_token, :string

    # If you already had password_digest and email, then add these:
    # remove_column :users, :email
    # remove_column :users, :password_digest
  end

  def down
    remove_column :users, :provider
    remove_column :users, :uid
    remove_column :users, :nickname
    remove_column :users, :access_token

    # If you already had password_digest and email, then add these:
    # add_column :users, :email, :string
    # add_column :users, :password_digest, :string
  end
end
