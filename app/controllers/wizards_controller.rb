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
  end
  def update
  	@wizard=Wizard.find(params[:id])
  	@wizard.battle(Wizard.first, 1)
  	@wizard.save
  end

  private

  def wizard_params
    params.require(:wizard).permit(:name, :magic_type)   
	end
end
