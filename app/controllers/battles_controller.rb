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
  end
end
