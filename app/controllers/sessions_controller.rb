class SessionsController < ApplicationController
	skip_before_filter :user_authenticate!, only: [:new, :create, :destroy], unless: :user_present?

	def new
	end

	def create
		@user = User.find_by_email(params[:email])
		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			redirect_to root_path
			flash[:notice] = "Logged in"
		else
			redirect_to root_path
			flash[:notice] = "Invalid email or password"
		end
	end

	def destroy
		session[:user_id] = nil
		# redirect_to root_path
		flash[:notice] = "Logged out!"
	end
end
