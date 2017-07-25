class SessionsController < ApplicationController
  before_action :authorize_user, only: [:destroy]

  def new
    @body_class = "login"
  end

  def create
    if params[:provider]
      login_with_google
    else
      login_by_email
    end
  end

  def destroy
    session.clear
    flash[:danger] = "Successfully logged out!"
    redirect_to root_path
  end

  private
  def login_by_email
    user = User.find_by(email: params[:session][:email])
    
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in!"
      redirect_to bike_events_path
    else
      flash[:danger] = "Invalid login. Please try again."
      redirect_to :back
    end
  end

  def login_with_google
    if email_associated_with_user_exists?
      user = User.find_by_email(auth)
    else
      user = User.find_or_create_from_auth(auth)
    end
    create_session(user)
    redirect_to root_path
  end

  def email_associated_with_user_exists?
    !User.find_by(email: auth.info.email).nil?
  end
  
  def auth
    request.env['omniauth.auth']
  end

  def create_session(user)
    if user
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in!"
    else
      flash[:danger] = "Invalid login. Please try again."
    end
  end
end
