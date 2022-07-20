class Userkey < ApplicationRecord
  belongs_to :user

  before_create :generate_token

  def self.validate_key(api_key)
<<<<<<< HEAD
    @key = Userkey.find_by(key: api_key)
    return @key
  end
  
  def increment_key_usage
    self.total_key_usage = total_key_usage + 1
    save
=======
    Userkey.find_by(key: api_key)
  end

  def increment_usage
        key.count = key.count + 1
        key.save

        user.total = user.total + 1
        user.save
>>>>>>> ae7f5bd621754dd1620e0a03462d6264a2d29006
  end

  private

<<<<<<< HEAD
  def self.generate_token(user_id)
    user = User.find(user_id)
    payload = { "username": user.username,
    "password": user.password,
    "key_no":  user.key_count + 1 }
    secret = "ace_collage"
    token = JWT.encode payload, secret, 'HS256'
    return token
  end

=======
  def generate_token
    payload = { "username": user.username,
            "password": user.password,
            "key_no":  user.key_count + 1 }
    secret = "ace_collage"
    self.key = JWT.encode payload, secret, 'HS256'
>>>>>>> ae7f5bd621754dd1620e0a03462d6264a2d29006
end 