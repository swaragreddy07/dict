require 'json'

class UsersController < ApplicationController
  def signup
    if session[:id]!= nil
      redirect_to users_index_path 
    end
  end

  def index
    if session[:id] == nil
      redirect_to root_path
    end
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
    user=User.find(session[:id])
    keys=JSON.parse user.keys
    if user.plan == '1' && keys.length() == 5
      redirect_to users_index_path, notice: "you cannot add anymore keys"
    elsif user.plan == '2' && keys.length() == 10
      redirect_to users_index_path, notice: "you cannot add anymore keys"
    else
      payload = { "username": user.username,
                  "password": user.password,
                  "key_no":  user.key_count+1 }
      secret = "ace_collage"
      token = JWT.encode payload, secret, 'HS256'
      keys.append(token)
      added_on = JSON.parse user.added_on
      added_on.append(Date.today.to_s)
      count = JSON.parse user.count
      count.append(0)
      user.keys = keys.inspect
      user.added_on = added_on.inspect
      user.count = count.inspect
      user.key_count = user.key_count + 1
      user.save
      redirect_to users_index_path
    end
  end
  
  def deletekey
    user = User.find(session[:id])
    keys = JSON.parse user.keys
    added_on = JSON.parse user.added_on
    count = JSON.parse user.count
    keys.delete_at(params[:id].to_i)
    added_on.delete_at(params[:id].to_i)
    count.delete_at(params[:id].to_i)
    user.keys = keys
    user.added_on = added_on
    user.count = count
    user.save
    redirect_to users_index_path
  end
  
  def pickplan

  end
  
  def plan
    user = User.find(session[:id])
    plan = params[:plan]
    if plan!= "1" && plan!= "2" && plan!= "3"
      redirect_to users_pickplan_path, notice: "please pick a valid plan"
    else
      user.plan = plan
      user.save
      redirect_to users_index_path
    end
  end
    
  def register
    date = Date.today.to_s
    @user = User.new(username: params[:username], password: params[:password],plan: "1", date: date, count: '[]', keys: '[]', added_on: '[]', total: 0, email: params[:email],key_count: 0)
    if @user.save
      session[:id] = @user.id
      redirect_to users_pickplan_path
    else
      render :signup
    end
  end
  
  def login
    if session[:id]!=nil
      redirect_to users_index_path 
    end
  end
  
  def logout
    session[:id] = nil
    redirect_to root_path
  end
  
  def enter
    user = User.find_by(username: params[:username])
    if user!= nil && user.password == params[:password]
      session[:id] = user.id
      redirect_to users_index_path
    else
      redirect_to users_login_path, notice: 'invalid username or  password'
    end
  end
end
