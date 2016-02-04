class BattlesController < ApplicationController
  def index
  end

  def create
  	@battle=Battle.create()
  	redirect_to battle_path(@battle)
  end

  def update
  end

  def show
  	@battle=Battle.find(params[:id])
  	@wizard=Wizard.find(@battle.wizard_id)
  	@opponent=Wizard.find(@battle.opponent_wizard_id)
  	@battle.fight
  end
end
