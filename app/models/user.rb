class User < ApplicationRecord
    has_many :userkeys
    validates :username,:password,:email,:plan, presence: true
    validates :username,:email, uniqueness: true

    def generate_token(user)
      payload = { "username": user.username,
            "password": user.password,
            "key_no":  user.key_count+1 }
      secret = "ace_collage"
      token = JWT.encode payload, secret, 'HS256'
      key=user.userkeys.create(key: token,added_on: Date.today,count: 0)
      key.save
      user.key_count = user.key_count + 1
      user.save
    end

    def generate_plan(user, plan)
      if plan!= "1" && plan!= "2" && plan!= "3"
        return false
      else
        user.plan = plan
        user.save
        return true
      end
    end
end
