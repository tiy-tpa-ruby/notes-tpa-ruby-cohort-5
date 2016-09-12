class Gravatar
  attr_accessor :email

  def initialize(email)
    @email = email
  end

  def email_hash
    md5 = Digest::MD5.new
    md5 << email.strip.downcase

    return md5.hexdigest
  end

  def profile_json
    HTTParty.get("http://gravatar.com/#{email_hash}.json")
  end

  def thumbnail
    json = profile_json

    entry = json["entry"].first

    return entry["thumbnailUrl"]
  end
end
