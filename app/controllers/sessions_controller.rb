class SessionsController < ApplicationController

  def new
    @body_class = "login"
  end

  def create
    #if the user logs in with Google
    user = User.find_or_create_from_auth(auth)
    if user
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in!"
      redirect_to root_path
    else
      flash[:danger] = "Invalid login. Please try again."
      redirect_to :back
    end

    #if the user logs in with email
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in!"
      redirect_to root_path
    else
      flash[:danger] = "Invalid login. Please try again."
      redirect_to :back
    end
  end

  def destroy
    session.clear
    flash[:danger] = "Successfully logged out!"
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
