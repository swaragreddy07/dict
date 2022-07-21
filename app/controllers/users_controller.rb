class UsersController < ApplicationController
  before_action :require_login, only: [:addkey, :deletekey,:pickplan, :plan, :logout, :index] 
  before_action :check_logged_in, only: [:signup, :login]

  def signup

  end

  def index
    today = Date.today
    #@user.reset_daily_calls
    if @user.last_activity_on != today
      @user.last_activity_on = today
      @user.total_api_calls_today = 0
      @user.save
    end
  end

  def home
    
  end
    
  def addkey
    if @user.user_key_limit_reached?
      redirect_to users_index_path, notice: "you cannot add anymore keys"
    else
      @user.user_keys.create
      redirect_to users_index_path
    end
  end
  
  def deletekey
    key = @user.userkeys.find(params[:id])
    key&.destroy
    redirect_to users_index_path
  end
  
  def pickplan
  
  end
  
  def plan
    if @user.generate_plan(params[:plan])
      redirect_to users_index_path
    else
      redirect_to users_pickplan_path, notice: "please pick a valid plan"
    end
  end
    
  def register
    date = Date.today
    @user = User.new(username: params[:username], email: params[:email], password: params[:password])
    if @user.save
      session[:id] = @user.id
      redirect_to users_pickplan_path
    else
      render :signup
    end
  end
  
  def login
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
      redirect_to root_path, notice: "You must be logged in to access the dasboard"
    else
      @user = User.find(session[:id])
    end
  end

  def check_logged_in
    if session[:id].present?
      redirect_to root_path, notice: "you are already logged in"
    end
  end
end