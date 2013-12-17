class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by(email: params[:logemail])

		if user && user.authenticate(params[:logpassword])
			session[:user_id] = user.id 
			redirect_to user_path(session[:user_id])
		else
			redirect_to new_user_path
		end

	end

	def destroy
		session[:user_id] = nil
		redirect_to(root_path)
	end
end