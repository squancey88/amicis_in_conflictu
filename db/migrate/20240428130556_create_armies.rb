class CreateArmies < ActiveRecord::Migration[7.1]
  def change
    create_table :armies, id: :uuid do |t|
      t.string :name
      t.references :game_system, null: false, foreign_key: true, type: :uuid
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
