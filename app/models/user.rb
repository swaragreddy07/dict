class User < ApplicationRecord
  has_many :userkeys
  validates :username,:password,:email,:plan, presence: true
  validates :username,:email, uniqueness: true

  before_create :initialize_user

  def generate_plan(user_plan)
    if user_plan != "1" && user_plan != "2" && user_plan != "3"
      return false
    else
      self.plan = user_plan
      save
      return true
    end
  end

  def usage_limit_reached?
    plan == "1" && total_api_calls_today >= 500 || 
    plan == "2" && total_api_calls_today  >= 2000 ||
    plan == "3" && total_api_calls_today  >= 10000
  end

  def increment_api_calls_usage!
    self.total_api_calls_today = total_api_calls_today + 1
    save
  end

  def user_key_limit_reached?
    keys_count = userkeys.count
    plan == '1' && keys_count == 5 ||
    plan == '2' && keys_count == 10
  end

  private

  def initialize_user
    self.plan = "1",
    self.total_api_calls_today = 0
    self.key_count = 0
    self.last_activity_on = Date.today
  end
end