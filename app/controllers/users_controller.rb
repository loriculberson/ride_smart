class UsersController < ApplicationController

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      flash[:success] = "Account Created!"
      redirect_to root_path
    else
      render :new
    end

  end

  private
  def user_params
    params.require(:user).permit( :username, :password, 
                                  :email, :image_url)
  end
end
