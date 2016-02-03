class SessionsController < ApplicationController
  def create
  	 puts "TEST: LOGGING IN *****************"
		 @user = User.where(email: params[:email]).first     
		 if @user and @user.password == params[:password] 
		 session[:user_id] = @user.id
		 redirect_to user_path(@user)
		else
			redirect_to root_path
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
  def opponent
  	@wizard=Wizard.find(params[:id])
  	@opponent=Wizard.where(user_id: 1).order("RANDOM()").first
  	session[:opponent_id]=@opponent.id
  	puts "OPPONENT SET"
  	redirect_to wizard_path(@wizard)
  end
end
