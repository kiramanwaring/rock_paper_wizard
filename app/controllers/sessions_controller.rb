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
  def wizard
  	@wizard=Wizard.find(params[:id])
  	session[:wizard_id]=@wizard.id
  	puts "Wizard SET"
  	redirect_to wizard_path(@wizard)
  end
  def opponent
  	@opponent=Wizard.find(params[:id])
  	session[:opponent_id]=@opponent.id
  	puts "OPPONENT SET"
  	@battle=Battle.create(wizard_id: current_wizard.id, opponent_wizard_id: @opponent.id)
  	@battle.save
  	redirect_to wizard_path(current_wizard)
  end
end
