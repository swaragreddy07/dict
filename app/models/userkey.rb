class Userkey < ApplicationRecord
  belongs_to :user

  before_create :generate_token

  def self.validate_key(api_key)
    Userkey.find_by(key: api_key)
  end

  def increment_usage
        key.count = key.count + 1
        key.save

        user.total = user.total + 1
        user.save
  end

  private

  def generate_token
    payload = { "username": user.username,
            "password": user.password,
            "key_no":  user.key_count + 1 }
    secret = "ace_collage"
    self.key = JWT.encode payload, secret, 'HS256'
end 