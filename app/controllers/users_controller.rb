class UsersController < ApplicationController

before_action :authenticated!, :set_user, :authorized!, except: [:new, :create]

def new
	@user = User.new
end
def show
	@user = User.find(session[:user_id])
end

def create
	@user = User.new(user_params)

	if @user.save
		redirect_to user_path(@user)
		session[:user_id] = @user.id
	else
		render :new
	end
end
def edit
end
def update
	user = User.find(session[:user_id])
	if user.update(user_params)
		redirect_to user_path(user)
	else
		render :edit
	end 
end
def destroy
	user = User.find(session[:user_id])
	if user.destroy
		redirect_to root_path
		session[:user_id] = nil
	else
		redirect_to user_path(user)
	end
end

private

def user_params
	params.require(:user).permit(:name, :email, :password, :password_confirmation)
end
def logged_in?
	session[:user_id].present?
end

def authenticated!
	unless logged_in?
		redirect_to new_session_path
	end
end

def set_user
	@user = User.find(params[:id])
end
def authorized!
	unless @user.id == session[:user_id]
		redirect_to user_path(session[:user_id])
	end
end
	

end