class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

before_action :current_user

    def current_user
  		if session[:user_id]
			@current_user = User.find(session[:user_id])
		end
	end
	def current_wizard
  		if session[:wizard_id]
			@current_wizard = Wizard.find(session[:wizard_id])
		end
	end 
	def current_opponent
  		if session[:opponent_id]
			@current_opponent = Wizard.find(session[:opponent_id])
		end
	end

end
