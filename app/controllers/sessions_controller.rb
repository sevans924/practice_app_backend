class SessionsController < ApplicationController
  def new
  end

  def create
    p params
    user = User.find_by(email: params[:email])
    if user
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to login_path
    end
  end

  def delete
    session[:user_id] = nil
    redirect_to login_path
  end


end
