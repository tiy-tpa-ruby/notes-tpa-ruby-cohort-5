require 'test_helper'

class GravatarTest < ActiveSupport::TestCase
  test "Can turn an email address into a correct MD5 hash" do
    gravatar = Gravatar.new("MyEmailAddress@example.com ")

    assert_equal "0bc83cb571cd1c50ba6f3e8a78ef1346", gravatar.email_hash
  end

  test "Can return profile json given an email address" do
    gravatar = Gravatar.new("gavin@gstark.com")

    json = gravatar.profile_json

    entry = json["entry"].first

    assert_equal "gavinstark", entry["displayName"]
  end

  test "Can return the thumbnail url for an email address" do
    gravatar = Gravatar.new("gavin@gstark.com")

    assert_equal "http://0.gravatar.com/avatar/6263840eb996969c4e8b22d38352d772",
      gravatar.thumbnail
  end
end
