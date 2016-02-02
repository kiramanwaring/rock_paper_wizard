class SessionsController < ApplicationController
  def create
  	 puts "TEST: LOGGING IN *****************"
		 @user = User.where(email: params[:email]).first     
		 if @user and @user.password == params[:password] 
		 session[:user_id] = @user.id
		 redirect_to user_path(@user)
		else
			redirect_to login_path
		end
  end

  def destroy
  	puts "TEST SIGNING OUT ***************************"
		if current_user
			session[:user_id] = nil
			# session.clear
			redirect_to root_path
		end
  end
  def new
    @user = User.new
  end
end
