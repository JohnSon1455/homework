require 'digest'

class SessionsController < ApplicationController
  def create
    # 驗證 email & password
    pw = user_params[:password]
    salted_pw = "xyz#{pw}827128#{pw}82-12j23h"
    hashed_password = Digest::SHA1.hexdigest(salted_pw)

    user = User.find_by(email: user_params[:email],
                        password: hashed_password)

    if user
      session[:mypassword] = user.id
      redirect_to "root_path"
    else
      redirect_to "/users/sign_in"
    end
  end

  def destroy
    session[:mypassword] = nil
    redirect_to "root_path"
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end