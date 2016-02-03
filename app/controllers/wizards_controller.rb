class WizardsController < ApplicationController
  def create
  	puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++"
  	puts "Testing Creating a Wizard"
  	@wizard = Wizard.new(wizard_params)
  	@user = current_user
  	@user.wizards.push(@wizard)
  	@wizard.save
	redirect_to user_path(@user)
  end

  def destroy
  	Wizard.find(params[:id]).destroy
  	# redirect_to root_path
  end
  def new
  	@wizard = Wizard.new
  end

  def show
  	@wizard=Wizard.find(params[:id])
  	# @battle=Battle.new(@wizard)
  	@battles=Battle.where(status: 0, wizard_id: @wizard.id) + Battle.where(status: 0, opponent_wizard_id: @wizard.id)
  	@opponents= Wizard.where(user_id: 1).order("RANDOM()").first + Wizard.where(user_id: 1).order("RANDOM()").first
  end
  def update
  	@opponent=Wizard.find(session[:opponent_id])
  	@wizard=Wizard.find(params[:id])
  	if @opponent.lives == 0
  		redirect_to opponent_session_path(@wizard)
  	end
  	# @wizard.battle(Wizard.find(session[:opponent_id]), 1)
  	@wizard.save
  end

  private

  def wizard_params
    params.require(:wizard).permit(:name, :magic_type)   
	end
end
