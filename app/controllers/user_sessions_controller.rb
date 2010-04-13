class UserSessionsController < ApplicationController
  def new
  end
  
  def create
    @user = User.find(:first, :conditions => {:username => params[:username]})
    if @user && @user.valid_password?(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash.now[:error] = "Invalid password/username"
      render 'new'
    end
  end
  
  def destroy
    @user = current_user
    session[:user_id] = nil
    redirect_to root_path
  end
end
