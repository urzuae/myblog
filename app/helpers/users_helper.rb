module UsersHelper
  def logged_in?
    @user = User.find_by_id(session[:user_id])
    !@user.nil?
  end
end
