class UserSessionsController < ApplicationController
  def new
  end
  
  def create
    @user = User.find(:first, :conditions => {
      :username => params[:username],
      :encrypted_password => User.crypt_password(params[:password])
    })
    if @user
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash.now[:error] = "Invalid username/password"
      render 'new'
    end
  end
  
  def destroy
    @user = User.find(session[:user_id])
    @user.destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
