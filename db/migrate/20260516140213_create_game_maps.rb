class CreateGameMaps < ActiveRecord::Migration[7.1]
  def change
    create_table :game_maps, id: :uuid do |t|
      t.string :map_type
      t.string :name
      t.jsonb :config

      t.references :owner, null: false, foreign_key: {to_table: :users}, type: :uuid

      t.timestamps
    end
  end
end
