class UsersController < ApplicationController
	skip_before_filter :user_authenticate!, only: [:new, :create], unless: :user_present?

	def index	
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			p 'session[:user_id] = @user.id'
			p session[:user_id] = @user.id
			redirect_to root_path
			flash[:notice] = "You signed up successfully"
		else
			render :new
			flash[:notice] = "Something went wrong"
		end
	end

	private

	def user_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation, :profile_image, :token, :status)
	end
end
