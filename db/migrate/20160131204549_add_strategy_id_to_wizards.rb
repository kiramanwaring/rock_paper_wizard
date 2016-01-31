class AddStrategyIdToWizards < ActiveRecord::Migration
  def change
    add_column :wizards, :strategy_id, :integer
  end
end
