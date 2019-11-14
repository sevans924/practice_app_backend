class UsersController < ApplicationController
  before_action :authorize!, only: [:index, :show]

  def new
    p session[:user_id]
    @user = User.new
  end

  def create
    user = User.create(user_params)
    session[:user_id] = user.id
    redirect_to user_path(user)
  end

  def show
    if id_matches_current_user?(params[:id])
      @user = User.find_by(id: params[:id])
      render :show
    else
      flash[:notice] = "Log in!!"
      redirect_to user_path(session[:user_id])
    end
  end

  private

            def find_user
              @user = User.find(params[:id])
          end


          def user_params
              params.require(:user).permit(:first_name, :last_name, :email, :password_digest)
          end

  


end
