class Word < ApplicationRecord
  def key_is_prsent(api_key,session)
    user = User.find(session)
    keys = user.userkeys.all
    if user.plan == '1'
      usage = 500
    elsif user.plan == '2'
      usage = 2000
    else
      usage = 10000
    end
    if user.total>= usage
      return 1
    else
      present = false
      keys.each do |item|
      if item.key == api_key
          present = true
          item.count = item.count+1
          user.total = user.total+1
          item.save
          user.save
          break
        end
      end
    end
    return present
  end
  
end
