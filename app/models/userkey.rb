class Userkey < ApplicationRecord
    belongs_to :user

  def self.validate_key(api_key)
    @key = Userkey.find_by(key: api_key)
    return @key
  end
  
  def increment_key_usage
    self.total_key_usage = total_key_usage + 1
    save
  end

  private

  def self.generate_token(user_id)
    user = User.find(user_id)
    payload = { "username": user.username,
    "password": user.password,
    "key_no":  user.key_count + 1 }
    secret = "ace_collage"
    token = JWT.encode payload, secret, 'HS256'
    return token
  end

end 