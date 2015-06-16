class UsersController < ApplicationController


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id 
      flash[:success] = "Account Created!"
      redirect_to root_path
    else
      render :new #store whatever content the @user submitted
                  #you don't want the params cleared out if the user doesn't fill in all the correct info 
                  #so rails holds onto it and presents the new form again
                  #if you redirect you lose all the content so 
                  #the current_path will be users_path
    end
  end

  private
  def user_params
    params.require(:user).permit( :username,
                                  :email)
  end
end
