class SessionsController < ApplicationController

  # def new
  # end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in!"
      redirect_to root_path
    else
      flash[:errors] = "Invalid login. Please try again."
      redirect_to :back
    end
  end

  # def destroy
  #   session.clear
  #   flash[:danger] = "You've logged out!"
  #   redirect_to root_path
  # end
end
