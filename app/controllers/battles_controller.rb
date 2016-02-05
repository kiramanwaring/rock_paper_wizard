class BattlesController < ApplicationController
  def index
  end

  def create
  	@battle=Battle.create(wizard_id: current_wizard.id, opponent_wizard_id: current_opponent.id)
  	@battle.save
  	redirect_to battle_path(@battle)
  end

  def update
  	@battle=Battle.find(params[:id])
	  @wizard=Wizard.find(@battle.wizard_id)
  	@opponent=Wizard.find(@battle.opponent_wizard_id)
  	@battle.w_move=params[:w_move]
  	@battle.fight()
    @wizard.save()
    @opponent.save()
    @wizard=Wizard.find(@battle.wizard_id)
    @opponent=Wizard.find(@battle.opponent_wizard_id)
  	@battle.save()
  end

  def show
  	@battle=Battle.find(params[:id])
  	@wizard=Wizard.find(@battle.wizard_id)
  	@opponent=Wizard.find(@battle.opponent_wizard_id)
  end
end
