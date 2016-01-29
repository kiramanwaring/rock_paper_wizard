class CreateStrategies < ActiveRecord::Migration
  def change
    create_table :strategies do |t|
      t.string :rock
      t.string :paper
      t.string :scissors

      t.timestamps null: false
    end
  end
end
