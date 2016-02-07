class UsersController < ApplicationController
	def index
		@users = User.all
		@user = current_user
		@my_wizards = @user.wizards.all
		@wizards = Wizard.order('wizards.level ASC')
	end

	def create
		puts "***** TESTING CREATING A NEW USER!"
	 # set variable to create new user using params set on /new page
	 @user = User.new(user_params)
	 # save the user that was created
	 if @user.save
		 session[:user_id] = @user.id
		 # redirect to the newly create user's profile page /show
		 redirect_to user_path(@user)
	 else
		 flash[:notice] = "Invalid Email"
 	 	redirect_to root_path
	 end
	end

	def destroy
		puts "***** TESTING DELETING USER"
		# set variable to find a specific user by user_id
		@user = User.find(params[:id])
		# delete user from database upon clicking link in /show
		@user.destroy
		# end session so the current_user method stops looking for their id
		session[:user_id] = nil

		# redirect to /index 
		redirect_to root_path
	end

	def show
	 # set variable to find user by user_id
	 @user = User.find(params[:id])
	 if @user.wizards.where("level > ?", 0).count == 0
	 	redirect_to new_wizard_path
	 end
	 @current_user = current_user
	 @wizards = @user.wizards.where("level > ?", 0)
	 @all_wizards = Wizard.order('wizards.level DESC')
	end


	def new
	if current_user
		redirect_to user_path(current_user)
	end
	 # set variable to create a new user
	 @user = User.new
	end
	private

	def user_params
		params.require(:user).permit(:email, :password, :user_id)   
	end
end
