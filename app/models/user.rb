class User < ApplicationRecord
    has_many :userkeys
    validates :username,:password,:email,:plan, presence: true
    validates :username,:email, uniqueness: true

<<<<<<< HEAD
    def generate_plan(user_plan)
      if user_plan != "1" && user_plan != "2" && user_plan != "3"
=======
    def keys_limit_reached?
      keys_count = userkeys.count
      (plan == '1' && keys_count == 5) ||
      (plan == '2' && keys_count == 10)
    end

  def usage_limit_reached?
      plan == "1" && total >= 500 || 
      plan == "2" && total >= 2000 ||
      plan == "3" && total >= 10000
  end

    def add_key
      userkeys.create(added_on: Date.today, count: 0)
      self.key_count = key_count + 1
      save
    end

    def generate_plan(user, plan)
      if plan!= "1" && plan!= "2" && plan!= "3"
>>>>>>> ae7f5bd621754dd1620e0a03462d6264a2d29006
        return false
      else
        self.plan = user_plan
        save
        return true
      end
    end

    def usage_limit_reached?
      if plan == "1" && total_api_calls_today >= 500 || 
         plan == "2" && total_api_calls_today  >= 2000 ||
         plan == "3" && total_api_calls_today  >= 10000
         return true
      else
         return false
      end
    end

    def increment_api_calls_usage
      self.total_api_calls_today = total_api_calls_today + 1
      save
    end

    def user_key_limit_reached?
      keys = userkeys.all
      if plan == '1' && keys.length() == 5 ||
         plan == '2' && keys.length() == 10
        return true
      else
        return false
      end
    end
      
    def generate_key
      @token = Userkey.generate_token(id)
      add_key
    end

    def add_key
      key = userkeys.create(key: @token,added_on: Date.today,total_key_usage: 0)
      self.key_count = key_count + 1
      save
    end
end
