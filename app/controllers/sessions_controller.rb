require 'digest'

class SessionsController < ApplicationController
  def create
    pw = user_params[:password]
    salted_pw = "c1#{pw}css#{pw}82$$c"
    hashed_password = Digest::SHA1.hexdigest(salted_pw)

    user = User.find_by(email: user_params[:email],
                        password: hashed_password)

    if user
      session[:user_token] = user.id
      redirect_to "/"
    else
      redirect_to "/users/sign_in"
    end
  end

  def destroy
    session[:user_token] = nil
    redirect_to "/"
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end