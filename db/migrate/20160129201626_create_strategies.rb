class CreateStrategies < ActiveRecord::Migration
  def change
    create_table :strategies do |t|
      t.integer :rock
      t.integer :paper
      t.integer :scissors

      t.timestamps null: false
    end
  end
end
