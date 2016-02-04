class BattlesController < ApplicationController
  def index
  end

  def create
  	@battle=Battle.create()
  	redirect_to battle_path(@battle)
  end

  def update
  	@battle=Battle.find(params[:id])
  	@wizard=Wizard.find(session[:wizard_id])
  	@opponent=Wizard.find(session[:opponent_id])
  	@battle.w_move=params[:w_move]
  	@battle.fight()
  	@battle.save()
  end

  def show
  	@battle=Battle.find(params[:id])
  	@wizard=Wizard.find(@battle.wizard_id)
  	@opponent=Wizard.find(@battle.opponent_wizard_id)
  end
end
