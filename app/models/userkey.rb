class Userkey < ApplicationRecord
  belongs_to :user

  before_create :initialize_key
  after_create :increment_user_key_count

  def self.validate_key(api_key)
    Userkey.find_by(key: api_key)
  end
  
  def increment_key_usage
    self.total_key_usage = total_key_usage + 1
    save
  end

  private

  def self.generate_token(user)
    payload = { "username": user.username,
                "password": user.password,
                "key_no":  user.key_count + 1 }
    secret = "ace_collage"

    JWT.encode payload, secret, 'HS256'
  end

  def initialize_key
    self.key = Userkey.generate_token(user)
    self.added_on = Date.today
    self.total_key_usage = 0
  end

  def increment_user_key_count
    user.key_count += 1
    user.save
  end

end 