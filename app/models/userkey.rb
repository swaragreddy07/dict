class Userkey < ApplicationRecord
    belongs_to :user

  def self.validate_key(api_key)
    return false unless key = Userkey.find_by(key: api_key) 
    return 1 if !key.can_access_key

    key.count += 1
    key.user.total += 1
    key.save && key.user.save
  end

  def can_access_key
    user = self.user
    return false if user.plan == "1" && user.total >= 500 || user.plan == "2" && user.total >= 2000 || user.plan == "3" && user.count >= 10000
    true
  end
end
