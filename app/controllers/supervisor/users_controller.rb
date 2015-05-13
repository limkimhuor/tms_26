class Supervisor::UsersController < ApplicationController
  def new
   @user = User.new
  end
  
  def create
   @user = User.new user_params
   if @user.save
     flash[:info] = t(:create_succes, model: :"User")
     redirect_to root_url
   else
     render "new"
   end
  end

  def show
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation
  end
end
