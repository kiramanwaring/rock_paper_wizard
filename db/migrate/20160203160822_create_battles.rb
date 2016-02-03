class CreateBattles < ActiveRecord::Migration
  def change
    create_table :battles do |t|
      t.integer :wizard_id
      t.integer :opponent_wizard_id
      t.integer :w_move
      t.string :o_move
      t.integer :status
      t.integer :winner

      t.timestamps null: false
    end
  end
end
