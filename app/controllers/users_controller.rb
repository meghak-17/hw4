class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params) # Use strong parameters

    if @user.save
      session[:user_id] = @user.id  
      redirect_to places_path
    else
      render :new  
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end

