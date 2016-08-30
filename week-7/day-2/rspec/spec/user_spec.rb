require_relative "../models/user"

# Unit test for User
describe User do
  it "should have a name" do
    # Setup
    user = User.new

    # inputs
    user.name = "Gavin"

    # expect/assert
    expect(user.name).to eq "Gavin"
  end

  it "should have favorite colors" do
    user = User.new

    user.favorite_colors = ["Red", "Green", "Blue"]

    expect(user.favorite_colors).to include("Red")
  end

  it "is only valid if they like the best color" do
    user = User.new

    user.favorite_colors = ["Red", "Green", "Blue"]

    expect(user).to be_valid
  end

  it "isn't valid if they don't like the best color" do
    user = User.new

    user.favorite_colors = ["Red", "Green", "Orange"]

    expect(user).to_not be_valid
  end

  context "as an admin" do
    it "should be valid if they like the best color and like more than three colors" do
      user = User.new
      user.admin = true

      user.favorite_colors = ["Red", "Green", "Blue", "Orange"]

      expect(user).to be_valid
    end

    it "shouldn't be valid if they like the best color, but don't like enough colors" do
      user = User.new
      user.admin = true

      user.favorite_colors = ["Blue", "Orange"]

      # Use all the ruby magic
      expect(user).to_not be_valid

      # non-magic
      # assert user.valid?
    end
  end
end
