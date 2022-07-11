class User < ApplicationRecord
    validates :username,:password,:email,:plan, presence: true
    validates :username,:email, uniqueness: true
end
