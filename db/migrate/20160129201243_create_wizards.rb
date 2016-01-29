class CreateWizards < ActiveRecord::Migration
  def change
    create_table :wizards do |t|
      t.string :name
      t.integer :type
      t.integer :level
      t.integer :lives
      t.integer :hp
      t.integer :attack
      t.integer :defense
      t.integer :exp
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
