class UserSessionsController < ApplicationController
  def new
  end
  
  def create
    @user = User.find(:first, :conditions => {:username => params[:username]})
    if @user
      if User.crypt_password(params[:password] + @user.password_salt) == @user.encrypted_password
        session[:user_id] = @user.id
        redirect_to root_path
      else
        flash.now[:error] = "Invalid password"
        render 'new'
      end
    else
      flash.now[:error] = "Invalid username"
      render 'new'
    end
  end
  
  def destroy
    @user = current_user
    session[:user_id] = nil
    redirect_to root_path
  end
end
