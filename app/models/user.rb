class User < ApplicationRecord
    has_many :userkeys
    validates :username,:password,:email,:plan, presence: true
    validates :username,:email, uniqueness: true

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
        return false
      else
        user.plan = plan
        user.save
        return true
      end
    end
end
