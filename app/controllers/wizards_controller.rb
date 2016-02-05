class WizardsController < ApplicationController
  def create
  	puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++"
  	puts "Testing Creating a Wizard"
  	@wizard = Wizard.new(wizard_params)
  	# names the wizard if the user left that feild blank
  	if @wizard.name == ""
  		@wizard.name = "Unnamed Wizard"
  	end
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
  	@wizard = Wizard.find(params[:id])
  	if @wizard.level == 0
  		redirect_to root_path
  	end
  	# @battle=Battle.new(@wizard)
  	@battles = Battle.where(status: 0, wizard_id: @wizard.id) + Battle.where(status: 0, opponent_wizard_id: @wizard.id)
  	# selects 5 random NPC's to fight, we can change this to all wizards later
  	@opponents= Wizard.where(user_id: 1).order('RANDOM()').first(15)
  end
  # def update
  # 	@opponent=Wizard.find(session[:opponent_id])
  # 	@wizard=Wizard.find(params[:wizard_id])
  # 	if @opponent.lives == 0
  # 		redirect_to opponent_session_path(@wizard)
  # 	end
  # 	# @wizard.battle(Wizard.find(session[:opponent_id]), 1)
  # 	@wizard.save
  # end

  private

  def wizard_params
    params.require(:wizard).permit(:name, :magic_type)   
	end
end
