module UsersHelper
  def user_signed_in?
    session[:mypassword] != nil
  end

  def current_user
    if user_signed_in?
      User.find(session[:mypassword])
    else
      nil
    end
  end
end