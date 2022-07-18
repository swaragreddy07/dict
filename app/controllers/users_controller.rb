class UsersController < ApplicationController
  before_action :require_login, only: [:index, :addkey, .. ] #except: [:login, :signup, :user_validation, :register, :home]


  def signup
    if session[:id].nil?
      redirect_to users_index_path 
    end
  end

  def index
    user = User.find(session[:id])
    today = Date.today
    if user.last_activity_on != today
      user.last_activity_on = today
      user.daily_calls_count = 0
      user.save
    end
  end

  def home
    
  end
    
  def addkey
      if @user.keys_limit_reached?
        redirect_to users_index_path, notice: "you cannot add anymore keys"
      else
        @user.generate_token
        redirect_to users_index_path
      end
  end
  
  def deletekey
    key = @user.userkeys.find(params[:id])
    key.destroy
    redirect_to users_index_path
  end
  
  def pickplan
  
  end
  
  def plan
    valid = @user.generate_plan(params[:plan])
    if !valid
      redirect_to users_pickplan_path, notice: "please pick a valid plan"
    else
      redirect_to users_index_path
    end
  end
    
  def register
    today = Date.today
    @user = User.new(username: params[:username], password: params[:password],plan: "1", total: 0, email: params[:email],key_count: 0)
    if @user.save
      session[:id] = @user.id
      redirect_to users_pickplan_path
    else
      render :signup
    end
  end
  
  def login
    if session[:id].present?
      redirect_to root_path
    end
  end
  
  def logout
    session[:id] = nil
    redirect_to root_path
  end
  
  def user_validation
    user = User.find_by(username: params[:username])
    if user.present? && user.password == params[:password]
      session[:id] = user.id
      redirect_to users_index_path
    else
      redirect_to users_login_path, notice: 'invalid username or  password'
    end
  end

  private 

  def require_login
    if session[:id] == nil
      return redirect_to root_path, notice: "You must be logged in to access the dasboard"
    end
    @user = User.find(session[:id])
  end

end
