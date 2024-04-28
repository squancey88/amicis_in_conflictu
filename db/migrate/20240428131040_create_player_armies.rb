class CreatePlayerArmies < ActiveRecord::Migration[7.1]
  def change
    create_table :player_armies, id: :uuid do |t|
      t.references :player, null: false, foreign_key: true, type: :uuid
      t.references :army, null: false, foreign_key: true, type: :uuid
      t.references :army_list, null: true, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
