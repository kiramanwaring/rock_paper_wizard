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
  	@battle.fight

  end

  def show
  	@battle=Battle.find(params[:id])
  	@wizard=Wizard.find(@battle.wizard_id)
  	@opponent=Wizard.find(@battle.opponent_wizard_id)
  	if @wizard.strategy_id
  		@battle.w_move=@wizard.strategy.move()
  	end
  	if @opponent.strategy_id
  		@battle.o_move=@opponent.strategy.move()
  	end
  end
end
