class Userkey < ApplicationRecord
    belongs_to :user

  def self.validate_key(api_key)
    key = Userkey.find_by(key: api_key)
    if key == nil
      return false
    else 
      user = User.find(key.user_id)
      if user.plan == "1" && user.total >= 500 || user.plan == "2" && user.total >= 2000 ||user.plan == "2" && user.total >= 10000
        return 1
      else
        key.count = key.count + 1
        user.total = user.total + 1
        key.save
        user.save
        return true
      end
    end
  end
end 