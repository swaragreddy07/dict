require 'json'

class UsersController < ApplicationController
  before_action :require_login, except: [:login, :signup, :user_validation, :register, :home]

  def require_login
    if session[:id] == nil
      redirect_to root_path, notice: "You must be logged in to access the dasboard"
    end
  end

  def signup
    if session[:id]!= nil
      redirect_to users_index_path 
    end
  end

  def index
    user = User.find(session[:id])
    date = Date.today.to_s
    if user.date!= date
      user.date = date
      user.total = 0
      user.save
    end
  end

  def home
    
  end
    
  def addkey
    user = User.find(session[:id])
    keys = user.userkeys.all
      if user.plan == '1' && keys.length() == 5
        redirect_to users_index_path, notice: "you cannot add anymore keys"
      elsif user.plan == '2' && keys.length() == 10
        redirect_to users_index_path, notice: "you cannot add anymore keys"
      else
        token = User.new
        token.generate_token(user)
        redirect_to users_index_path
      end
  end
  
  def deletekey
    user = User.find(session[:id])
    key = user.userkeys.find_by(params[:id])
    key.destroy
    key.save
    redirect_to users_index_path
  end
  
  def pickplan
  
  end
  
  def plan
    user = User.find(session[:id])
    plan = User.new
    valid = plan.generate_plan(user, params[:plan])
    if valid == false
      redirect_to users_pickplan_path, notice: "please pick a valid plan"
    else
      redirect_to users_index_path
    end
  end
    
  def register
    date = Date.today.to_s
    @user = User.new(username: params[:username], password: params[:password],plan: "1", total: 0, email: params[:email],key_count: 0)
    if @user.save
      session[:id] = @user.id
      redirect_to users_pickplan_path
    else
      render :signup
    end
  end
  
  def login
    if session[:id]!= nil
      redirect_to root_path
    end
  end
  
  def logout
    session[:id] = nil
    redirect_to root_path
  end
  
  def user_validation
    user = User.find_by(username: params[:username])
    if user!= nil && user.password == params[:password]
      session[:id] = user.id
      redirect_to users_index_path
    else
      redirect_to users_login_path, notice: 'invalid username or  password'
    end
  end
end
