class UsersController < ApplicationController
  def sign_up
		@user = User.new
	end

	def sign_in
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			redirect_to "/"
		else
			render :sign_up
		end
	end

  def destroy
		@user = User.find(current_user.id).destroy
		session[:user_token] = nil
		redirect_to "/"
  end

  def profile
	end

	private
	def user_params
		params.require(:user).permit(:email,
			                           :password,
																 :password_confirmation
																)
	end
	
end
