class Userkey < ApplicationRecord
    belongs_to :user

    def key_is_prsent(api_key)
      users = User.all
      key_is_present = false
      users.each do |user|
        keys = user.userkeys.all
        if user.plan == '1'
            usage = 500
        elsif user.plan == '2'
            usage = 2000
        else
            usage = 10000
        end
        present = false
        keys.each do |item|
          if item.key == api_key
            present = true
            item.count = item.count+1
            user.total = user.total+1
            user.save
            item.save
            key_is_present = true
            break
          end
        end
        if key_is_present == true
          if user.total>= usage
              return 1
          else
            return present
          end
        end
      end
    end
end
